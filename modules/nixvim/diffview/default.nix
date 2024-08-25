{ pkgs, ... }: {
  plugins.diffview = {
    enable = true;
  };
  extraPakages = with pkgs; [ mercurial ];
}
