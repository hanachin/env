include_recipe "../helper"

package "make"
package "libreadline-dev"
package "libsecret-1-dev"

build_from_source "/usr/bin/envchain" do
  cmd "cd envchain-1.0.1 && make && make install"
  url "https://github.com/sorah/envchain/archive/v1.0.1.tar.gz"
end
