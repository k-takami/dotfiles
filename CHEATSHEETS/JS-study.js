#記述位置
　関数（function）は、自分自身が記述されているscriptエレメント内及び自分よりも前
  要するにhead内に記述しておけば、どこからでも呼び出せる訳です。
  <html>外部は不適切
#複数記述
  関数を複数セットする場合はセミコロン(;)で区切る。
    <form action="" method="post">
        <input type="button" value="ボタン" onClick="func01(); func02(); func03()">
    </form>


#window.resize
  <script>
  </head>
    <script type="text/javascript" language="javascript">
      <!--
        function sample() { window.resizeTo(600,400); }
      // -->
    </script>
  </head>
  <body>
    <a onclick="sample()">ここをクリックすると、ウィンドウサイズが幅600、高さ400となります。</a>
  </body>
