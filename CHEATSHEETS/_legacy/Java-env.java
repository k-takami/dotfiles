#jUnit(eclipseやnetbeans IntelliIDEには初めから組み込み済み )
 project right-click--> new--> other--> java-> junit-> test case
 junit test生成後 以下の如くする

  public void test() {
    //fail("Not yet implemented");
    assertEquals(1,1);
  }

 テストクラス右クリック→run as jUnit testをえらぶ

 log設定は
   /tmdb/target/m2e-wtp/web-resources/log4j.properties
   /tmdb/target/m2e-wtp/web-resources/log4j.xml

  DB設定は
  /tmdb/src/main/resources/META-INF/spring/database.properties
  dbschemaは
    pgadmin->プラグイン->psql consoleで
      \l

  controllerは
    /tmdb/src/main/java/jp/co/nttcom/business/tmdb/web

  VIEWは
  /APPROOT/src/main/webapp/WEB-INF/views
  Localeは
  /APPROOT/src/main/webapp/WEB-INF/i18n


  /tmdb/src/main/webapp/WEB-INF/layouts/*jsp
  に
  <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
  と記述すると；
  /tmdb/src/main/webapp/WEB-INF/views/ 直下の*jspについては言語別ロケールファ
イル(i18n/*.properties)のメッセージを認識できるようになる；

  /tmdb/src/main/webapp/WEB-INF/views/ 配下サブフォルダーの下の*jspについて
は、各*.jspファイルごとに同様の記述をしないといけない。

各i18n/*.properties内部の記述はRailsのlocale/*ymlのインデント階層で表現はでき
ない。
  xxx.yyy.zzzの如くピリオドで階層構造を表現した単一階層的表記しかできない。

※グローバル変数的にタグライブラリーとその名前の宣言をするやり方は、いろいろし
らべましたが、Javaの初心者には調査がつきませんでした。
  <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


	ja
#spring-tool-framework
  ★spring-tool-suite-3.3.0.RELEASE-e4.3-win32-installer 550MB required : はﾛｰｶﾙｲﾝｽﾄｰﾙしないとJDK認識ｴﾗｰ
  " error coping file "...と表示されるときはworkspaceつくりなおす

  #plugin
    dashbord--> ページ左下の2タブ目 Extentions→SEarch subclipse --> check , next, install
    or
    Help-> Install New Software
      url : http://subclipse.tigris.org/update_1.6.x

   utf-8 editing = ecklipse property editor
    http://propedit.sourceforge.jp/eclipse/updates/

  #既存PJのマウントは file-import-general-"Existing Project into WorkSpace"
    File->new->others-> SVNからcheckout-> 新規repoi
        ->http://192.168.216.127/svn/tmdb 

 MVCうごかないときは右クリックでmaven-upgrade

 #I/O
  workspace間の設定ファイルI/O：Eclipseの設定をクリックして、エクスポート先と名前を選択する

`#Java言語でのi18n国際化手順`

