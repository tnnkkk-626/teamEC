set names utf8;
set foreign_key_checks=0;

drop database if exists i1810a;
create database if not exists i1810a;

use i1810a;

create table user_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) unique not null comment "ユーザーID",
password varchar(16) not null comment "パスワード",
family_name varchar(32) not null comment "姓",
first_name varchar(32) not null comment "名",
family_name_kana varchar(32) not null comment "姓かな",
first_name_kana varchar(32) not null comment "名かな",
sex tinyint not null default 0 comment "姓別",
email varchar(32) not null comment "メールアドレス",
status tinyint not null default 0 comment "ステータス",
logined tinyint not null default 0 comment "ログインフラグ",
regist_date datetime not null comment "登録日",
update_date datetime comment "更新日"
)
default charset=utf8
comment="会員情報テーブル"
;
insert into user_info values
(1,"guest","guest","インターノウス","ゲストユーザー","いんたーのうす","げすとゆーざー",0,"guest@gmail.com",0,0,now(),now()),
(2,"guest2","guest2","インターノウス2","ゲストユーザー2","いんたーのうす2","げすとゆーざー2",0,"guest2@gmail.com",0,0,now(),now()),
(3,"guest3","guest3","インターノウス3","ゲストユーザー3","いんたーのうす3","げすとゆーざー3",0,"guest3@gmail.com",0,0,now(),now()),
(4,"guest4","guest4","インターノウス4","ゲストユーザー4","いんたーのうす4","げすとゆーざー4",0,"guest4@gmail.com",0,0,now(),now()),
(5,"guest5","guest5","インターノウス5","ゲストユーザー5","いんたーのうす5","げすとゆーざー5",0,"guest5@gmail.com",0,0,now(),now()),
(6,"guest6","guest6","インターノウス6","ゲストユーザー6","いんたーのうす6","げすとゆーざー6",0,"guest6@gmail.com",0,0,now(),now()),
(7,"guest7","guest7","インターノウス7","ゲストユーザー7","いんたーのうす7","げすとゆーざー7",0,"guest7@gmail.com",0,0,now(),now()),
(8,"guest8","guest8","インターノウス8","ゲストユーザー8","いんたーのうす8","げすとゆーざー8",0,"guest8@gmail.com",0,0,now(),now()),
(9,"guest9","guest9","インターノウス9","ゲストユーザー9","いんたーのうす9","げすとゆーざー9",0,"guest9@gmail.com",0,0,now(),now()),
(10,"guest10","guest10","インターノウス10","ゲストユーザー10","いんたーのうす10","げすとゆーざー10",0,"guest10@gmail.com",0,0,now(),now()),
(11,"guest11","guest11","インターノウス11","ゲストユーザー11","いんたーのうす11","げすとゆーざー11",0,"gues11t@gmail.com",0,0,now(),now()),
(12,"guest12","guest12","インターノウス12","ゲストユーザー12","いんたーのうす12","げすとゆーざー12",0,"guest12@gmail.com",0,0,now(),now());

create table product_info(
id int primary key not null auto_increment comment "ID",
product_id int unique not null comment "商品ID",
product_name varchar(100) unique not null comment "商品名",
product_name_kana varchar(100) not null comment "商品名かな",
product_description varchar(255) not null comment "商品詳細",
category_id int not null not null comment "カテゴリID",
price int comment "価格",
image_file_path varchar(100) comment "画像ファイルパス",
image_file_name varchar(50) comment "画像ファイル名",
release_date datetime not null comment "発売年月",
release_company varchar(50) comment "発売会社",
status tinyint not null default 0 comment "ステータス",
regist_date datetime not null comment "登録日",
update_date datetime comment "更新日",
foreign key(category_id) references m_category(category_id)
)
default charset=utf8
comment="商品情報テーブル"
;
insert into product_info values
( 1, 1,"Harrier","はりやー","高級ラグジュアリーSUVの元祖ともいえる代表モデル。また、初代・2代目ともに北米市場では、レクサス「RX」として販売されました。",2,100,"./images/japan","harrier.jpg",now(),"TOYOTA",0,now(),now()),
( 2, 2,"AE86","えーいーはちろく","1983年にトヨタ自動車が発売したカローラとスプリンターのスポーツモデルである4代目カローラレビン/スプリンタートレノの共通車両型式番号。俗にハチロクという呼称が付けられています。",2,860,"./images/japan","86.jpg",now(),"TOYOTA",0,now(),now()),
( 3, 3,"GTR","じーてぃーあーる","2007年から日産自動車が製造・販売しているノッチバッククーペ型のスポーツカー。生産は仕向地に関係なく、全て栃木工場が担当しています。",2,300,"./images/japan","gtr.jpg",now(),"日産",0,now(),now()),
( 4, 4,"LS500H","えるえす","フラッグシップセダンの風格とエモーショナルさを両立した独創的なフォルムです。",2,100,"./images/japan","ls500h.jpg",now(),"TOYOTA",0,now(),now()),
( 5, 5,"Rush","らっしゅ","ダイハツが開発・生産を担当し、トヨタへもOEM供給するコンパクトSUVモデル。ダイハツでは「ビーゴ」として販売しています。",2,200,"./images/japan","rush.jpg",now(),"TOYOTA",0,now(),now()),
( 6, 6,"RX7","あーるえっくす","1978年からマツダが開発・製造を開始した7、ロータリーエンジンを搭載したスポーツカーです。",2,300,"./images/japan","rx7.jpg",now(),"MATSUDA",0,now(),now()),
( 7, 7,"s660","えすろっぴゃくろくじゅう","軽のオープンエアスポーツカー。Copenとライバル的存在です。",2,100,"./images/japan","s660.jpg",now(),"HONDA",0,now(),now()),
( 8, 8,"Vezel","べぜる","ミニバンの使いやすさや燃費性能とジャンルの枠を超えた多面的な価値を高次元で融合させた車種として開発されました。",2,200,"./images/japan","vezel.jpg",now(),"HONDA",0,now(),now()),
( 9, 9,"Copen","こぺん","軽のオープンエアスポーツカー。s660とライバル的存在です。",2,660,"./images/japan","copen.jpg",now(),"DAIHATSU",0,now(),now()),

( 10, 10,"Escaredo","えすかれーど","すべてを極めた唯一無二のラグジュアリーカー。 羨望を集める、圧倒的な存在感を放つフォルムが特徴です。",3,1260,"./images/america","Escarade.jpg",now(),"Caddillac",0,now(),now()),
( 11, 11,"ATS-V","えーてぃーえすぶい","誇り高きレーシングスピリットと高性能を携えて圧巻のパフォーマンスを見せつけます。",3,1104,"./images/america","ATSV.jpg",now(),"Caddillac",0,now(),now()),
( 12, 12,"CTS-V","しーてぃーえすぶい","パフォーマンスを限界まで高めるためのデザイン。興奮に満ちたドライビング体験をもたらす、 比類ないダイナミズム。",3,1475,"./images/america","CTSV.jpg",now(),"Caddillac",0,now(),now()),
( 13, 13,"LimousineA","りむじんA","アメリカ製の最高峰のラグジュアリーカーです。",3,2000,"./images/america","Limdin.jpg",now(),"Caddillac",0,now(),now()),
( 14, 14,"Corvette","こるべっと","公道からサーキットまでを席巻するピュアスポーツです。",3,1200,"./images/america","corvette.jpg",now(),"Chevrolet",0,now(),now()),
( 15, 15,"Camaro","かまろ","乗るたびに鼓動が高鳴る、伝統と先進が融合した空間。",3,700,"./images/america","camaro.jpg",now(),"Chevrolet",0,now(),now()),
( 16, 16,"Navigator","なびげーたー","現在考えられる必要とされる装備を集約した究極のアメリカンSUV。",3,820,"./images/america","navigator.jpg",now(),"Lincoln",0,now(),now()),
( 17, 17,"LimousineB","りむじんB","成功のシンボル、贅の限りを尽くした空間",3,2000,"./images/america","limousine.jpg",now(),"Lincoln",0,now(),now()),
( 18, 18,"Continental","こんちねんたる","歴代モデルからデザインを変更。メーカーも自信を持つ新型コンチネンタルです。",3,993,"./images/america","Continentaru.jpg",now(),"Lincoln",0,now(),now()),

( 19, 19,"Aventador","あべんたどーる","サスペンションはプッシュロッド式、エンジンは新設計のV12、最高速度は350km/h以上のモンスターカーです。",4,4500,"./images/italy","aventdor.jpg",now(),"Lamborghini",0,now(),now()),
( 20, 20,"Centenario","ちぇんてなりお","クーペが20台、ロードスターが同じく20台の計40台の限定生産モデルです。",4,22000,"./images/italy","chentenario.jpg",now(),"Lamborghini",0,now(),now()),
( 21, 21,"Veneno","べねーの","ヴェネーノの台数は、顧客向け販売用としてはわずか9台で、その内の１台が998万ユーロ（約12億7,500万円）という値段で、売られています。",4,44000,"./images/italy","veneno.jpg",now(),"Lamborghini",0,now(),now()),
( 22, 22,"Portofino","ぽるとふぃーの","車名は「イタリアで最も美しい町」として知られる港町「ポルトフィーノ」が由来です。",4,2350,"./images/italy","purutofirno.jpg",now(),"Maserati",0,now(),now()),
( 23, 23,"488Spider","よんはちはちすぱいだー","アルミ製のトップを採用し構造は458スパイダーを踏襲しています。",4,3450,"./images/italy","488spider.jpg",now(),"Maserati",0,now(),now()),
( 24, 24,"458Italia","よんごーはちいたりあ","車名の458は4.5Lのエンジン排気量と8気筒を表します。",4,2920,"./images/italy","458itaria.jpg",now(),"Maserati",0,now(),now()),
( 25, 25,"GranTurismo","ぐらんつーりすも","ハイ・パフォーマンスとラグジュアリー。この相反する要素を一切の妥協なく融合させた作品です。",4,2600,"./images/italy","guranturizumo.jpg",now(),"Maserati",0,now(),now()),
( 26, 26,"Quattroporte","くあとろぽんて","入念に計算された快適性、利便性に優れた技術、比類なきイタリアンスタイルを再現しています。",4,2200,"./images/italy","kuatoroporute.jpg",now(),"Maserati",0,now(),now()),
( 27, 27,"Ghibli","ぎぶり","究極の贅沢とエレガンスに、大胆なデザインと先進のテクノロジーを兼ね備えています。",4,2500,"./images/italy","giburi.jpg",now(),"Maserati",0,now(),now());

create table cart_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
temp_user_id varchar(16) comment "仮ユーザーID",
product_id int not null comment "商品ID",
product_count int not null comment "個数",
price int not null comment "金額",
regist_date datetime not null comment "登録日",
update_date datetime comment "更新日"
)
default charset=utf8
comment="カート情報テーブル"
;

create table purchase_history_info(
id int primary key not null auto_increment  comment "ID",
user_id varchar(16) not null comment "ユーザーID",
product_id int not null comment "商品ID",
product_count int not null comment "個数",
price int not null comment "金額",
destination_id int not null comment "宛先情報ID",
regist_date datetime not null comment "登録日",
update_date datetime comment "更新日",
foreign key(user_id) references user_info(user_id),
foreign key(product_id) references product_info(product_id)
)
default charset=utf8
comment="購入履歴情報テーブル"
;

create table destination_info(
id int primary key not null  auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
family_name varchar(32) not null comment "姓",
first_name varchar(32) not null comment "名",
family_name_kana varchar(32) not null comment "姓かな",
first_name_kana varchar(32) not null comment "名かな",
email varchar(32) not null comment "メールアドレス",
tel_number varchar(32) not null comment "電話番号",
user_address varchar(50) not null comment "住所",
regist_date datetime not null comment "登録日",
update_date datetime comment "更新日"
)
default charset=utf8
comment="宛先情報テーブル"
;
insert into destination_info values
(1,"guest","竹内リーダー","克","たけうちりーだー","かつ","takeuchi@internous.co.jp","090-1111-2222","千葉県市川市原木中山１２３－４５６－７８９",now(),now());

create table m_category(
id int primary key not null comment "ID",
category_id int not null unique comment "カテゴリーID",
category_name varchar(20) not null unique comment "カテゴリ名",
category_description varchar(100) comment "カテゴリ詳細",
insert_date datetime not null comment "登録日",
update_date datetime comment "更新日"
)
default charset=utf8
comment="カテゴリーマスター"
;
insert into m_category values
(1,1,"全てのカテゴリー","日本車、アメリカ車、イタリア車全ての各国の車のカテゴリーが対象となります",now(), now()),
(2,2,"日本車","日本産車に関するカテゴリーが対象となります",now(),now()),
(3,3,"アメリカ車","アメリカ産車に関するカテゴリーが対象となります",now(),now()),
(4,4,"イタリア車","イタリア産車に関するカテゴリーが対象となります",now(),now());

