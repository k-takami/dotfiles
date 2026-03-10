// 🟦キャッシュ回避用のsuffixをつけたしてジャンプ；
function jump_with_datetime_get_param() {
    var url_to_jump = $(this).closest('a')[0].href + `&t=${new Date().getTime()}` ; console.log(url_to_jump);
    window.location.href = url_to_jump;
}
// 🟦全角/半角空白、タブ、改行を除去
function sanitize(str) { return str.replace(/[\s\u3000\t\n\r]+/g, '').trim() }

// 🟦 DOM
function doc__qS__set_attr_style_by(val, selector) {
    var node = document.querySelector(selector);
    if (node) node.setAttribute("style",val);
}

function hide_elements_with_indices(nodes, indices = [0], style = 'display: none;') {
    if (nodes.length === 0) {return;}
    indices.forEach(i => { nodes[i]?.setAttribute('style', style); })
}


// ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝　タイムアンドマネー関数　＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
function time_regexp_to_hour(matched_obj){
    var startHour = parseInt(matched_obj[1]), startMin = parseInt(matched_obj[2]);
    var endHour = parseInt(matched_obj[3]), endMin = parseInt(matched_obj[4]);
    // 分に変換・validation
    var startMinutes = startHour * 60 + startMin;
    var endMinutes = endHour * 60 + endMin;
    var totalMinutes = endMinutes - startMinutes;
    if (totalMinutes <= 0) return;
    return totalMinutes / 60;
}

function monetary_selector_to_2wages(jq_element, selector, actualHours){
    var salaryMatch = jq_scrape_wage(jq_element, selector);
    if (!salaryMatch) return; // 日給が見つからない場合スキップ
    var dailyPay = parseInt(salaryMatch[1].replace(/,/g, '')); // コンマ除去
    var hourlyPay = Math.round(dailyPay / actualHours);
    return [dailyPay, hourlyPay];
}

// ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝　以下はjQuery依存関数　＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

function jq_any(ary, str) { return $.inArray(str, ary) !== -1 }
// 🟦年月日文字から曜日つけたして返す
function jq_yymmdd_wday(element) {
    if (element.length === 0) {console.error('対象要素が見つかりません'); return }

    // テキストを抽出（.text() で子要素のテキストを結合）し、サニタイズ
    var rawText = sanitize(element.text());
    var dateMatch = rawText.match(/(\d+)月(\d+)日/);
    if (!dateMatch) {console.error('日付が見つかりません');return }

    var month = parseInt(dateMatch[1], 10);  // 月（例: 11）
    var day = parseInt(dateMatch[2], 10);    // 日（例: 8）
    var year = new Date().getFullYear();     // 現在の年（例: 2025）
    // Dateオブジェクト作成（月は0-indexなので-1）
    var date = new Date(year, month - 1, day);
    // 有効性チェック（無効日付の場合NaN）
    if (isNaN(date.getTime())) {console.error('無効な日付です');return }

    // フォーマット: YY-MM-DD(曜日)
    var YY = (year % 100).toString().padStart(2, '0');  // 2桁年（例: 25）
    var MM = month.toString().padStart(2, '0');         // 2桁月（例: 11）
    var DD = day.toString().padStart(2, '0');           // 2桁日（例: 08）
    var weekday = date.toLocaleDateString('ja-JP', { weekday: 'short' }); // 曜日（例: 土）
    var formattedDate = `${YY}-${MM}-${DD} (${weekday})`; // 例: "25-11-08(土)"
    //console.log('展開日付:', formattedDate); // 出力例: "25-11-08(土)"
    return formattedDate;
}


// 汎用：jQuery要素(x)をセレクターで探索しサニタイズし(y)、正規表現マッチ結果(z)を得る
function jq_scrape_and_get_match_obj(jq_element, selector,regexp){
    var html = jq_element.find(selector);
    var tmp = sanitize(html.text());
    var matched_obj =  tmp.match(regexp);
    return [html, tmp, matched_obj];
}
// 労働時間を抽出（日付後の時間部分、例: "08:30～17:00"）
function jq_scrape_time_slot(jq_element, selector) {
    var [x,y,z] = jq_scrape_and_get_match_obj(
        jq_element, selector, /(\d{1,2}):(\d{2})[～\-\s]+(\d{1,2}):(\d{2})/
    )
    return [x,z];
}
// 給与文言抽出（数字部分のみ、例: "11,000"）
function jq_scrape_wage(jq_element, selector) {
    var [x,y,z] = jq_scrape_and_get_match_obj(
        jq_element, selector, /(\d{1,3}(?:,\d{3})*)円/i
    )
    return z;
}

