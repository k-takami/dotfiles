overriding
Rails.cache.fetch(name, options = nil) {状況によりわたされるブロック}
のwrapper化または
ActiveSupport::Cache:Store#fetchのOverrideについて

状況により(ブロック引数を受け取るがRailsのバージョンごとに処理ﾛｼﾞｯｸに差がある
状況により(ブロック引数を受け取るばあい、ブロックをProc型の明示的引数または暗黙的(=略記的)引数として受け取るが
その判別が煩雑でバグを生みやすい。

これらの理由によりwrapper化もオーバーライドも断念することにしたい；
なお、lib/iss_bridge.rb内で以下のように書けばIssBridge.cache.fetch(キャッシュキー名, オプション) {ブロック}で呼び出せる；

　module IssBridge
　　(...)　
　　# 主モジュール
　　class << self
　　　(...)
　　 　def cache
　　　　 IssBridge::Cache
　　　 end
　　end

　　class Cache # < ActiveSupport::Cache:Store
　　　def self.fetch(name, options = nil)
　　　　if IssBridge.use_system_cache_store
　　　　　Rails.cache.fetch(name, options)
　　　　　# Rails.cache.fetch(name, options) { yield options if block_given? } みたく書けばよいのだろうが、ブロック引数は呼び元で明示的だったり暗黙的だったりする
　　　　end
　　　end
　　end
　end





initialize & super()
インナークラスのメソッドチェーン https://paiza.io/projects/ZOlmpfEyi-EF9TlSj7OXxQ
  例１
  
class LockInfo
    class State
        attr_accessor :state
        def initialize(_state)
            @state = _state
        end
        Unlocked = new("unlocked")
    end
    
    def State
        dummy = Module.new 
        def dummy.Unlocked
            State::Unlocked
        end
        dummy
    end
end

lock = LockInfo.new
p lock.State.Unlocked





