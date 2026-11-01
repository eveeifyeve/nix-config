{
  requireFile,
  stdenv,
  undmg,
  lib,
  ...
}:
stdenv.mkDerivation {
  pname = "rex-terminal";
  version = "0.1.0";

  src = requireFile {
    name = "rex.dmg";
    url = "https://superlogical.com";
    hash = "sha256-sZIRbP6T/I+c8jtKsLd60DfJUqK92aTs/xiC20Jrv48=";
  };

  nativeBuildInputs = [
    undmg
  ];

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/Applications
    cp -R *.app/Contents/MacOS/ $out/ # Required for the Skills to work
    cp -R *.app $out/Applications/
  '';

  dontFixup = true;

  meta = {
    description = "Built-in terminal multiplexer that can share sessions";
    homepage = "https://superlogical.com";
    license = lib.licenses.unfree;
    maintainers = [ lib.maintainers.eveeifyeve ];
    platforms = lib.platforms.darwin;
  };
}
