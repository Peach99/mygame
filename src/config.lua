
-- 0 - disable debug info, 1 - less debug info, 2 - verbose debug info
DEBUG = 1

-- display FPS stats on screen
DEBUG_FPS = true

-- dump memory info every 10 seconds
DEBUG_MEM = false

-- load deprecated API
LOAD_DEPRECATED_API = false

-- load shortcodes API
LOAD_SHORTCODES_API = true

-- screen orientation
CONFIG_SCREEN_ORIENTATION = "landscape"

-- design resolution
CONFIG_SCREEN_WIDTH  = 800
CONFIG_SCREEN_HEIGHT = 480

-- auto scale mode
CONFIG_SCREEN_AUTOSCALE = "FIXED_WIDTH"

TILEDWIDTH = 32
TILEDHEIGHT = 32


CHENG_IMAGE =  "cheng.png"
MAI_IMAGE  =   "mai.png"
KE_IMAGE   =   "ke.png"
JI_IMAGE  =    "ji.png"

NORMAL_MENU =  "normal_menu.png"
PRESS_MENU  =  "press_menu.png"
MENU_LOGO   =  "menuLogo.png"
RAINBOW     =  "rainbow.png"

DIALOG_BG ="popuplayer/dialog_bg.png"
BUTTON_BG1 ="popuplayer/button_bg1.png"
BUTTON_BG2 ="popuplayer/button_bg2.png"
BUTTON_BG3 ="popuplayer/button_bg3.png"

PATH_MARK_1 ="map/mark1.png"
PATH_MARK_2 ="map/mark2.png"
PATH_MARK_3 ="map/mark3.png"
PATH_MARK_4 ="map/mark4.png"
PATH_MARK_5 ="map/mark5.png"
PATH_MARK_6 ="map/mark6.png"

DIGITAL_0 ="digital_0.png"
DIGITAL_1 ="digital_1.png"
DIGITAL_2 ="digital_2.png"
DIGITAL_3 ="digital_3.png"
DIGITAL_4 ="digital_4.png"
DIGITAL_5 ="digital_5.png"
DIGITAL_6 ="digital_6.png"
DIGITAL_7 ="digital_7.png"
DIGITAL_8 ="digital_8.png"
DIGITAL_9 ="digital_9.png"

FONT_MENU   = "Marker Felt"
SINGLE_GAME = "single_game"
MULTI_GAME  = "multi_game"
MUSIC_ON    = "music_on"
MUSIC_OFF   = "music_off"
LOAD_GAME   = "load_game"
QUIT_GAME   = "quit_game"
MUSIC_ON_KEY  ="music_on_key"
OK ="ok"
CANCEL ="cancel"

DIALOG_TITLE  ="dialog_title"
DIALOG_CONTENT ="dialog_content"

BEACH_ITEM ="map/beach_item.png"
SEA_ITEM ="map/sea_item.png"
SNOW_ITEM ="map/snow_item.png"

STAGE_BACKGROUND ="map/stage_background2.png"
RIGHT_BANNER ="map/right_banner.png"
PLAYER_ME ="map/player1.png"
PLAYER_ENEMY1 ="map/player2.png"
GO_BUTTON ="map/go.png"
PLAYER_ME_ANIM ="map/player1_anim.png"
PLAYER_ENEMY1_ANIM ="map/player2_anim.png"
PLAYER1_ANIM_PLIST   ="map/player1_anim.plist"
PLAYER1_ANIM_PNG ="map/player1_anim.png"


PLAYER2_ANIM_PLIST ="map/player2_anim.plist"
PLAYER2_ANIM_PNG= "map/player2_anim.png"

PLAYER_1_NAME ="player1"
PLAYER_1_TAG = 1;
PLAYER_2_NAME ="player2"
PLAYER_2_TAG = 2;

MSG_GO ="msg_go"
MSG_BUY ="msg_buy_land"
MSG_PICKONE_TOGO ="msg_pickone_togo"
MSG_PAY_TOLLS ="msg_pay_tolls"
MSG_AROUND_LAND ="msg_around_land"
MSG_RANDOM_ASK_EVENT ="msg_random_ask_event"
MSG_BLOCK_WAY_EVENT ="msg_block_way_event"
MSG_HANDLE_PROP_EVENT ="msg_handle_prop_event"
MSG_ROUND_COUNT ="msg_round_count"
MSG_REST ="msg_rest"
MSG_STRENGTH_UP ="msg_strength_up"
MSG_LOTTERY ="msg_lottery"
MSG_MOVE_ONE_STEP ="msg_move_one_step"
MSG_DIMISS_DIALOG ="msg_dimiss_dialog"
MSG_STOCK ="msg_stock"
MSG_STOCK_LAYER_DISMISS ="msg_stock_layer_dismiss"
MSG_USE_SKILL ="msg_use_skill"
MSG_GAME_OVER ="msg_game_over"
MSG_LOAD_GAME ="msg_load_game"

MSG_GO_HIDE_TAG = 0;
MSG_GO_SHOW_TAG = 1;

MSG_BUY_BLANK_TAG  = 2;
MSG_BUY_LAND_1_TAG = 3;
MSG_BUY_LAND_2_TAG = 4;

MSG_PICKONE_TOGO_TAG =5;

MSG_PAY_TOLLS_1_TAG = 6;
MSG_PAY_TOLLS_2_TAG = 7;
MSG_PAY_TOLLS_3_TAG = 8;
MSG_AROUND_LAND_TAG = 9;
MSG_RANDOM_ASK_EVENT_TAG =10;
MSG_BLOCK_WAY_EVENT_TAG = 11;
MSG_HANDLE_PROP_EVENT_TAG =12;
MSG_ROUND_COUNT_TAG =13;
MSG_REST_TAG = 14;
MSG_STRENGTH_UP30_TAG = 15;
MSG_STRENGTH_UP50_TAG = 16;
MSG_STRENGTH_UP80_TAG = 17;
MSG_LOTTERY_TAG = 18;
MSG_MOVE_ONE_STEP_TAG = 19;
MSG_DIMISS_DIALOG_PUBLISH_LOTTERY_TAG = 20;
MSG_STOCK_TAG = 21;
MSG_STOCK_LAYER_DISMISS_TAG = 22;
MSG_USE_SKILL_TAG = 23;
MSG_GAME_OVER_TAG = 24;
MSG_LOAD_GAME_TAG = 25;

LAND_BLANK_MONEY = 1000;
LAND_LEVEL_1_MONEY = 2000;
LAND_LEVEL_2_MONEY = 3000;

BUY_LAND_MSG = "buy_land_msg"
PLAYER1_1_PARTICLE_PLIST = "images/showClick.plist"
PLAYER2_1_PARTICLE_PLIST = "images/fire.plist"

PLAYER1_1_PARTICLE_PNG ="images/foot1.png"
PLAYER2_1_PARTICLE_PNG ="images/foot2.png"

PLAYER1_2_PARTICLE_PNG ="images/starfish1.png"
PLAYER2_2_PARTICLE_PNG ="images/starfish2.png"

PLAYER1_3_PARTICLE_PNG ="images/heart1.png"
PLAYER2_3_PARTICLE_PNG ="images/heart2.png"

PLANE_PNG = "images/plane.png"

TOAST_SHOW_TIME = 2.0;


TAX_REBATES_TAG = 1; --政府鼓励投资，返还税金10000
PAY_TAXES_TAG = 2; --政府严查账务，补交税金20000
LOSS_STRENGTH_TAG =3;--喝到假酒，上吐下泻，体力耗光
PHYSICAL_RECOVERY_TAG =4;--吃了大补丸，体力恢复
INVESTMENT_DIVIDENDS_TAG = 5 ;--投资获利，分红20000
INVESTMENT_LOSS_TAG = 6; --投资失败，亏损30000

STORM_UP_TAG = 7; --暴风骤雨技能升级
STEP_UP_TAG = 8; --随心步技能升级
TRANSFER_UP_TAG = 9; --巧取豪夺技能升级



TAX_REBATES ="tax_rebates"
PAY_TAXES ="pay_taxes"
LOSS_STRENGTH ="loss_strength"
PHYSICAL_RECOVERY ="physical_recovery"
INVESTMENT_DIVIDENDS ="investment_dividends"
INVESTMENT_LOSS ="investment_loss"
STORM_SKILL_UP ="storm_skill_up"
STEP_SKILL_UP ="step_skill_up"
TRANSFER_SKILL_UP ="transfer_skill_up"

IN_HOSPITAL ="in_hospital"
PLAYER_HURT ="player_hurt"
RICH_DAY ="rich_day"
IN_HOSPITAL_REMAIN ="in_hospital_remain"
STRENGTH_UP ="strength_up"
PICK_BALL ="pick_ball"
SELECT_LOTTERY_TITLE ="select_lottery_title"
BUY_OK ="buy_ok"
BUY_LOTTERY ="buy_lottery"
BUY_LOTTERY_MONEY = 1000;
GOEND = 1;
MOVEPASS = 0;
PUBLISH_LOTTERY ="publish_lottery"
LOTTERY_WIN_MONEY = 50000;
LOTTERY_ROUND_FREQUENTLY = 10;

AUDIO_ON ="images/audio_on.png"
AUDIO_OFF ="images/audio_off.png"

RICH_TECHNOLOGY ="rich_technology"
RICH_OIL ="rich_oil"
ICBC ="icbc"
HUATUO_MEDICINE ="huatuo_medicine"
DEMOLITION_CONSTRUCTION ="demolition_construction"

STOCK_CODE ="stock_code"
STOCK_NAME ="stock_name"
STOCK_NOWPRICE ="stock_nowprice"
STOCK_DEALPRICE ="stock_dealprice"
STOCK_PERCENT ="stock_percent"
STOCK_STORE ="stock_store"

PLAYER_MONEY ="player_money"
NO_MONEY_BUY_STOCK ="no_money_buy_stock"

BUY ="buy"
SELL ="sell"
SHARES ="shares"

RAIN ="rain"
YOURS_IS_MINE = "yours_is_mine"
GOBY_HEART ="goby_heart"
GRADE ="grade"
LOST_STRENGTH ="lost_strength"
DOWN_GRADE ="down_grade"
GOBY_HEART_INFO ="goby_heart_info"
YOURS_IS_MINE_INFO ="yours_is_mine_info"

YOUR_STRENGTH_IS_LOW ="your_strength_is_low"
SAVE_SUCESS ="save_sucess"
SAVE_FAIL ="save_fail"

BUTTON_CLICK ="sound/click.wav"
BUTTON_CLICK_01 ="sound/click_01.wav"
STORM_EFFECT ="sound/storm.wav"
PARTICLE_EFFECT ="sound/particle.mp3"
LOTTERY_EFFECT ="sound/lottery.wav"


BLOCK_THE_WAY ="sound/effect_00056.wav"


P1_DEYIDEYITIAN  ="sound/byelottery.wav"--拜拜 祝您中奖
P1_need1000  ="sound/need1000.wav"--只要1000元
P1_select_lottery  ="sound/select_lottery.wav"--请圈选你要购买的彩票
P1_meirendejiang ="sound/meirendejiang.wav"--sorry 本月份没有人得奖
P1_xiwangshini  ="sound/xiwangshini.wav"--希望下次得奖者就是您
P1_Speaking_00181 = "sound/Speaking_00181.wav"--投资获利
P1_Speaking_00182 = "sound/Speaking_00182.wav"--投资失败
--交过路费声音
P1_Speaking_00435="sound/Speaking_00435.wav"--oh 哈利路亚
P1_Speaking_00461="sound/Speaking_00461.wav"--oh 我的血汗钱
P1_Speaking_00475="sound/Speaking_00475.wav"--算了算了 老子有的是钱
P1_Speaking_01060="sound/Speaking_01060.wav"--老本都快没了
P1_Speaking_001062 = "sound/Speaking_001062.wav"--拿去了不用找了
--抢夺别人地块
P1_Speaking_00429 = "sound/Speaking_00429.wav"--让我把他据为己有
--房屋被抢夺
P1_Speaking_00430 ="sound/Speaking_00430.wav"--黄金地段 让给你
P1_Speaking_00464 ="sound/Speaking_00464.wav"--太不给面子了
P1_Speaking_00469 ="sound/Speaking_00469.wav"--你皮子痒啊
P1_Speaking_00470 ="sound/Speaking_00470.wav"--竟敢在太岁头上动土
P1_Speaking_00476 ="sound/Speaking_00476.wav"--算你狠
--房屋被摧毁
P1_Speaking_00462 ="sound/Speaking_00462.wav"--好大的胆子
P1_Speaking_00463 ="sound/Speaking_00463.wav"--谁敢动我的地
P1_Speaking_00466 ="sound/Speaking_00466.wav"--竟敢破坏我的好事
P1_Speaking_00468 ="sound/Speaking_00468.wav"--拆的还真干净
P1_Speaking_00474 ="sound/Speaking_00474.wav"--你有没有搞错啊
P1_Speaking_001061 ="sound/Speaking_001061.wav"--真没良心
--摧毁别人房屋
P1_Speaking_00433 ="sound/Speaking_00433.wav"--不必谢我
P1_Speaking_00437 ="sound/Speaking_00437.wav"--全部夷为平地
--螃蟹伤人
P1_Speaking_00449 ="sound/Speaking_00449.wav"--快来帮我把
P1_Speaking_01054 ="sound/Speaking_01054.wav"--我惨了
P1_Speaking_01055 ="sound/Speaking_01055.wav"--哎呦喂啊
P1_Speaking_001071 = "sound/Speaking_001071.wav"--我不要打针
--看到别人住院
P1_Speaking_001073= "sound/Speaking_001073.wav"--别闹了
--收取过路费
P1_Speaking_00453 ="sound/Speaking_00453.wav"--小本经营 概不赊欠
P1_Speaking_01059 ="sound/Speaking_01059.wav"--蝇头小利
P1_Speaking_01057 ="sound/Speaking_01057.wav"--这是我应得的
--升级房子
P1_Speaking_01051 ="sound/Speaking_01051.wav"--别嫉妒我
P1_Speaking_001066= "sound/Speaking_001066.wav"--我真佩服自己
--不交过路费
P1_Speaking_00446 ="sound/Speaking_00446.wav"--有钱也不给你
P1_Speaking_00477 ="sound/Speaking_00477.wav"--可别想占我便宜啊
--买地
P1_Speaking_00458 ="sound/Speaking_00458.wav"--盖什么好呢
P1_Speaking_001067= "sound/Speaking_001067.wav"--我是个大地主
--捡到珍珠
P1_Speaking_01052 ="sound/Speaking_01052.wav"--鸿运当头
P1_Speaking_001063= "sound/Speaking_001063.wav"--上帝保佑
--对方被罚收税
P1_Speaking_00452 ="sound/Speaking_00452.wav"--别想偷漏税


--交过路费声音
P2_SPEAKING01 ="sound/p2_Speaking01.wav" --违章建筑怎么没人管哪
P2_QISIWOLE    = "sound/p2_qisiwole.wav" --气死我了
P2_XINHAOKONGA = "sound/p2_xinhaokonga.wav" --我心好痛啊
P2_BUHUIBA  ="sound/p2_buhuiba.wav" --不会吧
P2_PAYHIGH  ="sound/p2_payhigh.wav" --不觉得这条路的收费太贵了吗
P2_QIANGQIANA = "sound/p2_qiangqiana.wav" --抢钱啊
P2_HEBAOCHUXIE = "sound/p2_hebaochuxie.wav" --荷包大出血
--抢夺别人地块
P2_BIEGUAIWO  ="sound/p2_bieguaiwo.wav" --别怪我
P2_SPEAKING02 ="sound/p2_Speaking02.wav" --想不到有这一招吧
P2_TIGER  ="sound/p2_tiger.wav" -- 老虎不发威 把我当病猫
P2_NIDEJIUSHODE ="sound/p2_nidejiushode.wav" --你的就是我的 我的还是我的
--房屋被抢夺
P2_ZHENMIANMU  ="sound/p2_zhenmianmu.wav" --终于认清你的真面目了
P2_WODEDIQI  ="sound/p2_wodediqi.wav" --谁偷了我的地契
P2_HAOQIFU ="sound/p2_haoqifu.wav" --别以为老娘好欺负
P2_WANGFA ="sound/p2_wangfa.wav" -- 这还有王法吗
--摧毁别人房屋
P2_NIGAIWOCHAI = "sound/p2_nigaiwochai.wav" --你盖我就拆
P2_KANWODE ="sound/p2_kanwode.wav" --看我的
P2_HAIRENLE ="sound/p2_hairenle.wav" --我又要害人了
P2_BAOCHOU ="sound/p2_baochou.wav" --报仇的时候到了
--房屋被摧毁
P2_WODEYANGFANG  ="sound/p2_wodeyangfang.wav" --我的洋房
P2_QIFURENJIA  ="sound/p2_qifurenjia.wav" --欺负人家
P2_SHAQIANDAO  ="sound/p2_shaqiandao.wav" --你这个杀千刀的
P2_LIANXIANGXIYU  ="sound/p2_lianxiangxiyu.wav" --你不会怜香惜玉啊
P2_HAOJIUGAIHAO ="p2_haojiugaihao.wav" --人家花了好久才盖好的
--螃蟹伤人
P2_YUNQICHA ="sound/p2_yunqicha.wav" --运气太差了
P2_HAIRENJING ="sound/p2_hairenjing.wav" --害人精
P2_XIAOHUANG ="sound/p2_xiaohuang.wav" --小黄快来帮我
P2_YISHENG ="sound/p2_yisheng.wav" --医生在哪里
--看到别人住院
P2_DUOXIUXI ="sound/p2_duoxiuxi.wav" --多休息一会儿吧
P2_XIUXIJITIAN ="sound/p2_xiuxijitian.wav" --休息几天吧
--体力增加
--收取过路费
P2_RENBUWEIJI  ="sound/p2_renbuweiji.wav" --人不为己天诛地灭
P2_XIAOQI  ="sound/p2_xiaoqi.wav" --小气吧啦=
P2_RONGXING ="sound/p2_rongxing.wav" --这是你们的荣幸
P2_MANYI ="sound/p2_manyi.wav" --恩 我很满意
P2_XIAOFUPO ="sound/p2_xiaofupo.wav" --我是小富婆
P2_DUOGEI ="sound/p2_duogei.wav" --怎么不多给一点啊
--升级房子
P2_HIGHER     =  "sound/p2_higher.wav" --盖的越高越好
P2_WANZHANGGAOLOU ="sound/p2_wanzhanggaolou.wav" --万丈高楼平地起
--不交过路费
P2_NOTPAY     =  "sound/p2_notpay.wav"      --不付也是应该的
P2_YIMAOBUGEI = "sound/p2_yimaobugei.wav" --一毛都不给你
--买地
P2_BUYIT      =  "sound/p2_buyit.wav" --买了它
P2_HAODEKAISHI ="sound/p2_haodekaishi.wav" --好的开始是成功的一半
P2_RANGNIZHU ="sound/p2_rangnizhu.wav" --我的漂亮房子让你住
P2_MAIWOBA  ="sound/p2_maiwoba.wav" --这块地卖我吧
--捡到珍珠
P2_DEYIDEYITIAN ="sound/p2_deyideyitian.wav"--得意的一天
P2_HENGCAI ="sound/p2_hengcai.wav " --人无横财不富
--对方被罚收税
P2_TOUSHUI = "sound/p2_toushui.wav" --看你一副偷漏税的样子
P2_FALVZHICAI ="sound/p2_falvzhicai.wav" --接受法律的制裁吧
P2_GUOKU ="sound/p2_guoku.wav" --交钱给国库吧
P2_NASHUI ="sound/p2_nashui.wav" --纳税是国民应尽的义务
STORM_SPEAKING  ="sound/storm_speaking.wav" --龙卷风侵袭 摧毁房屋一栋
LOTTERY_PUBLISH_WAV = "sound/lottery_publish.wav"
M120  ="sound/m120.mp3"
LOTTERY_NUM ="sound/lottery_num.wav" --请圈选您的幸运号码
MASHANGKAIJIANG  ="sound/mashangkaijiang.wav" --现在马上开出这期的号码

 

BG01_MP3 ="sound/bg01.mp3" 
BG02_MP3 ="sound/bg02.mp3" 
BG03_MP3 ="sound/bg03.mp3" 

WALK_MP3 ="sound/walk.mp3" 
