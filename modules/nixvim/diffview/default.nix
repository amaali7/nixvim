{ pkgs, ... }: {
  plugins.diffview = {
    enable = true;
  };
  extraPackages = with pkgs; [ mercurial ];
}
