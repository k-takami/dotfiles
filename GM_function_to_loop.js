// 成功を示すグローバルオブジェクトを定義
window.MyRequiredModule = {
    isLoaded: true,
    version: '1.0',
    function_to_loop: function() { 
        'use strict';
        function initFilter() {
            console.log("🔵ページ読み込むごとに初期化");
            eval(function_to_loop +"()")
            // 動的に読み込まれる投稿に対応するため、オブザーバーを設定。関数の外出しにするかは要判断；
            var observer = new MutationObserver(eval(function_to_loop));
            observer.observe(document.body, {childList: true, subtree: true});
        }
        //window.location.reload(true); // <---NG: キャッシュつかわずにリロード
        initFilter();  //window.addEventListener('load', initFilter); //DD: <---不要に見える
    }
};
console.log('----------GM Module loaded');  // デバッグ用

// (function() {
// })();
