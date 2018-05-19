#Rspec
    module Sequences
      class Base
        include Mongoid::Document
        #連番保存コレクション名
        store_in collection: 'sequences'

        class << self
          INCREMENTOR ||= MongoidAutoIncrement::Incrementor.new

          def sequence_key
            @sequence_key ||= name.underscore.sub('sequences/', '')
          end

          #連番の初期値reset
          def reset(num)
            existing_counter = Sequences::Base.where(seq_name:
    "#{sequence_key}").last
            existing_counter.delete unless existing_counter.nil?
            INCREMENTOR.inc("#{sequence_key}", { seed: num.to_i - 1 })
          end

          # つぎの連番を取得する
          def next
            INCREMENTOR.inc("#{sequence_key}", {})
          end
        end
      end
    end


  SHUMOKU_CD = Code.shumoku_cd
  SHUMOKU_ZOKUSEI_CD = Code.shumoku_zokusei_cd
  JOKEN_CD = TogoEntry::TogoEntryCode.jokennado_cd

  before do
    @buk_tokucho_tbl = TogoEntry::BukTokuchoTbl.new
    @buk_shosai_tbl = TogoEntry::BukShosaiTbl.new(shumoku_cd: SHUMOKU_CD.uri_mansion)
    @buk_setsubitokki_tbls = TogoEntry::BukSetsubitokkiTbl.new({
        setsubitokki_kb: TogoEntry::TogoEntryCode.setsubi_tokki_cd.tokki
    })
    @buk_atbb_snd_wk = TogoEntry::BukAtbbSndWk.new(
                                          buk_tokucho_tbl: @buk_tokucho_tbl,
                                          buk_shosai_tbl: @buk_shosai_tbl,
                                          buk_setsubitokki_tbls: [@buk_setsubitokki_tbls]
                                       )
