require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.name = "test:integration"
  t.test_files = FileList['test/integration/test*.rb']
  t.verbose = true
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.name = "test:all"
  t.test_files = FileList['test/**/test*.rb']
  t.verbose = true
end
