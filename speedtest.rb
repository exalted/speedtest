require_relative './utils'

class SpeedTest
  def best_server
    response = `#{SpeedTest.cmd} --list`.lines[0].split_keeping(/\)/).strip
    SpeedTest.server_hash(response)
  end

  def run_test(server)
    results = `speedtest-cli --simple --server #{server['Id']}`
    SpeedTest.results_hash(results)
  end

  def export_csv(results)
    results
      .flat_map { |_, v| v }
      .map { |e| e.tr('.', ',') }
      .join(';')
  end

  def self.cmd
    'speedtest-cli --simple'
  end

  def self.results_hash(results)
    results
      .lines
      .map { |line| line.split(':').strip }
      .map { |name, result| [name, result.split.strip] }
      .to_h
  end

  def self.server_hash(server)
    { 'Id' => server[0], 'Description' => server[2..-1].join }
  end
end
