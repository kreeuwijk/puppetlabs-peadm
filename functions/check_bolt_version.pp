# Checks if the current Bolt version matches the SemVerRange defined in $supported_bolt_version
# Fails the calling plan if false, does nothing if true.
# Accepts a parameter for the $supported_bolt_version for unit testing purposes
function peadm::check_bolt_version(
  $supported_bolt_version = '>= 2.42.0 < 4.0.0'
) {
  $supported = (peadm::bolt_version() =~ SemVerRange($supported_bolt_version))

  unless $supported {
    fail(@("REASON"/L))
      This version of puppetlabs-peadm requires Bolt version ${supported_bolt_version}.

      You are using Bolt version ${peadm::bolt_version()}.

      Please make sure you have a compatible Bolt version and try again.

      | REASON
  }
}
