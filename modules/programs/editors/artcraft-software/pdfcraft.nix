{
  homeManager.modules.gui =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.pdfcraft ];
    };
}
