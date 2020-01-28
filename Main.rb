require "csv"
require "gr/plot"
require_relative "./Perceptron"

def main
  # 学習用データを取得
  inputs = CSV.read("./trainingData.csv")

  # ファイル読み込みはString型なので各要素をNumeric型に変換
  inputs = inputs.map{|in2| in2.map(&:to_i)}

  # 学習用データを入力と出力で分割
  input_data = Array.new(inputs.size).map {Array.new(2)}
  input_ans = Array.new(inputs.size)
  inputs.size.times do |i|
    input_data[i] = inputs[i].slice(0..1)
    input_ans[i] = inputs[i][-1]
  end

  # 学習を開始(学習用データ全てに正答するまで学習し続ける)
  cnt = 0
  perceptron = Perceptron.new(1)
  loop do
    perceptron.forward(input_data, input_ans, true)
    puts "cnt:#{cnt += 1} w1:#{perceptron.weight[0]} w2:#{perceptron.weight[1]} flag:#{perceptron.is_all_corrected}"
    p perceptron.output
    p perceptron.activated_output
    puts
    break if perceptron.is_all_corrected
  end
end

def plot_border(perceptron, input_data)
  input_data.each do |input|
    3
  end
end

# コマンドラインから呼び出されたときのみ実行する
if __FILE__ == $0
  main
end
