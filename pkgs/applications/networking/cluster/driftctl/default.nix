{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "driftctl";
  version = "0.17.0";

  src = fetchFromGitHub {
    owner = "cloudskiff";
    repo = "driftctl";
    rev = "v${version}";
    sha256 = "sha256-JloeRoW+1tepSJzhcOQu38TDQfY10NtG2EyeVhP26BQ=";
  };

  vendorSha256 = "sha256-aaJ5fpS+BiVq1K8OxN+/CBD96wy3flGDhch8O2ACIh8=";

  ldflags = [
    "-X github.com/cloudskiff/driftctl/build.enableUsageReporting=false"
    "-X github.com/cloudskiff/driftctl/build.env=release"
    "-X github.com/cloudskiff/driftctl/pkg/version.version=v${version}"
  ];

  meta = with lib; {
    description = "Tool to track infrastructure drift";
    homepage = "https://github.com/cloudskiff/driftctl";
    license = licenses.asl20;
    maintainers = with maintainers; [ kaction ];
  };
}
