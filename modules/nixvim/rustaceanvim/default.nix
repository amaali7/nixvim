{
  plugins.rustaceanvim = {
    enable = true;
    rustAnalyzerPackage = null;
    settings = {
      server = {
        default_settings = {
          rust-analyzer = {
            diagnostics = {
#              experimental = true;
            };
            procMacro = {
              ignored = {
                leptos_macro = [
                  "component"
                  "server"
                ];
              };
            };

            check = {
              command = "clippy";
            };
            inlayHints = {
              lifetimeElisionHints = {
                enable = "always";
              };
            };
          };
        };
        standalone = false;
      };
      dap = {
        excutable = {
          args = [ "--interpreter=dap" "--eval-command" "set print pretty on" ];
          command = "gdb";
        };
        name = "gdb";
      };
    };
  };
}
