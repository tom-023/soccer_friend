module ApplicationHelper
  def devise_error_messages
   return "" if resource.errors.empty?
   html = ""
   # エラーメッセージ用のHTMLを生成
   messages = resource.errors.full_messages.each do |msg|
     html += <<-EOF
       <div class="alert" role="alert">
         <span class="error_msg">#{msg}</span>
       </div>
     EOF
   end
   html.html_safe
  end

  def team
    ["北海道コンサドーレ札幌","ヴァンラーレ八戸","いわてグルージャ盛岡",
     "ブラウブリッツ秋田","モンテディオ山形","ベガルタ仙台",
     "福島ユナイテッドFC","水戸ホーリーホック","栃木SC",
     "鹿島アントラーズ","浦和レッズ","大宮アルディージャ",
     "ジェフユナイテッド千葉","柏レイソル","FC東京",
     "東京ヴェルディ","FC町田ゼルビア","川崎フロンターレ",
     "横浜F・マリノス","横浜FC","Y.S.C.C.横浜",
     "湘南ベルマーレ","SC相模原","ザスパクサツ群馬",
     "ヴァンフォーレ甲府","松本山雅FC","AC長野パルセイロ",
     "カターレ富山","アルビレックス新潟","ツエーゲン金沢",
     "FC岐阜","清水エスパルス","ジュビロ磐田","藤枝MYFC",
     "アスルクラロ沼津","名古屋グランパス","京都サンガF.C.",
     "ガンバ大阪","セレッソ大阪","ヴィッセル神戸",
     "ファジアーノ岡山","ガイナーレ鳥取","サンフレッチェ広島",
     "レノファ山口FC","カマタマーレ讃岐","徳島ヴォルティス",
     "愛媛FC","アビスパ福岡","ギラヴァンツ北九州",
     "サガン鳥栖","V・ファーレン長崎","大分トリニータ",
     "ロアッソ熊本","鹿児島ユナイテッドFC","FC琉球"]
  end
end
