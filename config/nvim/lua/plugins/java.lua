return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local jdtls = require "jdtls"

      local mason_path = vim.fn.stdpath "data" .. "/mason/packages"
      local jdtls_path = mason_path .. "/jdtls"

      if vim.fn.isdirectory(jdtls_path) == 0 then
        vim.notify("jdtls is not installed. Run :MasonInstall jdtls java-debug-adapter java-test", vim.log.levels.WARN)
        return
      end

      local bundles = {}

      -- java-debug-adapter (optional)
      local java_debug_jar = vim.fn.glob(mason_path .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar")
      if java_debug_jar ~= "" then
        vim.list_extend(bundles, vim.split(java_debug_jar, "\n"))
      end

      -- java-test (optional)
      local java_test_jars = vim.fn.glob(mason_path .. "/java-test/extension/server/*.jar")
      if java_test_jars ~= "" then
        vim.list_extend(bundles, vim.split(java_test_jars, "\n"))
      end

      -- Determine OS and arch-specific config dir
      local os_config
      local is_arm = vim.fn.system("uname -m"):find "arm64" or vim.fn.system("uname -m"):find "aarch64"
      if vim.fn.has "mac" == 1 then
        os_config = is_arm and "config_mac_arm" or "config_mac"
      elseif vim.fn.has "unix" == 1 then
        os_config = is_arm and "config_linux_arm" or "config_linux"
      else
        os_config = "config_win"
      end

      -- Find JDK 21+ for running jdtls (required by jdtls 1.57+)
      local java_cmd = "java"
      local jdk21_home = vim.fn.system("/usr/libexec/java_home -v 21 2>/dev/null"):gsub("\n", "")
      if vim.fn.isdirectory(jdk21_home) == 1 then
        java_cmd = jdk21_home .. "/bin/java"
      end

      -- Per-project workspace directory
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = vim.fn.stdpath "data" .. "/jdtls-workspace/" .. project_name

      local config = {
        cmd = {
          java_cmd,
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-Xmx1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens", "java.base/java.util=ALL-UNNAMED",
          "--add-opens", "java.base/java.lang=ALL-UNNAMED",
          "-jar", vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
          "-configuration", jdtls_path .. "/" .. os_config,
          "-data", workspace_dir,
        },

        root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" },

        settings = {
          java = {
            signatureHelp = { enabled = true },
            completion = {
              favoriteStaticMembers = {
                "org.hamcrest.MatcherAssert.assertThat",
                "org.hamcrest.Matchers.*",
                "org.hamcrest.CoreMatchers.*",
                "org.junit.jupiter.api.Assertions.*",
                "java.util.Objects.requireNonNull",
                "java.util.Objects.requireNonNullElse",
                "org.mockito.Mockito.*",
              },
            },
            sources = {
              organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
              },
            },
          },
        },

        init_options = {
          bundles = bundles,
        },
      }

      -- Set up capabilities from NvChad defaults
      config.capabilities = vim.lsp.protocol.make_client_capabilities()

      -- Java-specific keymaps (set when jdtls attaches)
      config.on_attach = function(client, bufnr)
        local map = vim.keymap.set
        local opts = function(desc)
          return { buffer = bufnr, desc = desc }
        end

        map("n", "<leader>jo", function() jdtls.organize_imports() end, opts "Java Organize imports")
        map("n", "<leader>jv", function() jdtls.extract_variable() end, opts "Java Extract variable")
        map("v", "<leader>jv", function() jdtls.extract_variable(true) end, opts "Java Extract variable")
        map("n", "<leader>jc", function() jdtls.extract_constant() end, opts "Java Extract constant")
        map("v", "<leader>jc", function() jdtls.extract_constant(true) end, opts "Java Extract constant")
        map("v", "<leader>jm", function() jdtls.extract_method(true) end, opts "Java Extract method")
        map("n", "<leader>jtc", function() jdtls.test_class() end, opts "Java Test class")
        map("n", "<leader>jtm", function() jdtls.test_nearest_method() end, opts "Java Test nearest method")

        -- Setup DAP after jdtls attaches
        jdtls.setup_dap { hotcodereplace = "auto" }
        require("jdtls.dap").setup_dap_main_class_configs()
      end

      jdtls.start_or_attach(config)
    end,
  },
}
