require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = package['name']
  s.module_name  = package['name']
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']

  s.author       = package['author']
  s.homepage     = package['homepage']

  s.source       = { :git => package['repository']['url'] }
  s.vendored_frameworks = "Frameworks/*"
  s.resource_bundles = {
    package['name'] => ["Rescources/*"],
  }

  s.library = 'c++'
  s.xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
    'CLANG_CXX_LIBRARY' => 'libc++'
  }
end
