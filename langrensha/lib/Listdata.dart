class Listdata {

    // ['assets/person1.png','甄姬'], 0
    // ['assets/person2.png','曹丕'], 1 
    // ['assets/person3.png','你'], 2
    // ['assets/person4.png','朱烁'], 3
    // ['assets/person5.png','吴质'], 4
    // ['assets/person6.png','曹操'], 5
    // ['assets/person7.png','司马懿'], 6
    // ['assets/person7.png','崔氏'], 7
    //index  0:对话内容  1:对话框类型  2:对话框人物  3.背景类型
    //对话框类型 : 0.旁白 1.人物靠右 2.人物靠左
    //对话框人物 : 6个
    //背景类型: 0.书房  1.卧室  2.集市 3.军营 4.府中 5.饭桌 6.后花园 7.草地 8.闺房 9.开头
  static const List startlists=[
    ['    自夏商周至秦汉,三国魏晋南北朝,隋,唐,宋,元,明,清,天下大势分分合合,中华民族的历史绵延数千年.  ', 0, 0, 9],
    ['    自夏商周至秦汉,三国魏晋南北朝,隋,唐,宋,元,明,清,天下大势分分合合,中华民族的历史绵延数千年.  ', 0, 0, 9],
    ['    历史长河中蕴藏着多少辉煌,也就潜藏着多少遗憾.  ', 0, 0, 9],
    ['    这一份遗憾令我们回望历史之时不免带着深深的无奈,叹息,后悔.  ', 0, 0, 9],
    ['    若,这一次,你站在历史的岔路口,你有能力去影响历史,你会遵循历史,亦或是一意孤行的改变?  ', 0, 0, 9],
    ['    请选择你的游戏难度...  ', 0, 0, 9, [Listdata.lists,['简单模式','普通模式','困难模式' ]]],
  ];

  static const List lists = [
    //简单模式
   [ 
      ['    故事开始于建安十七年,八月。 ', 0, 0, 2],
      ['    故事开始于建安十七年,八月。 ', 0, 0, 2],
      ['    叶城,在竣工不久的铜雀台旁,身为曹家大公子,曹植,字子桓,你正在与好友兼门客的吴质,朱烁一行正在城中巡视. ', 0, 0, 2],
      ['    大公子,你是否记得前一阵子,主上的宴会上来了一个不速之客? ', 2, 4, 2],
      ['    你是说,那个已经被主上斩了的妖道? ', 2, 3, 2],
      ['    主上让我接替了校师府的很多职责,而此事主上已经派我前去彻查. ', 2, 3, 2],
      ['    话说最近父王的头痛病愈加严重,莫非是与这个妖道有关? ', 1, 2, 2],
      ['    这个不能肯定,但是现在这个阶段,我们必须杜绝这种谣言在城中散播,避免动摇军心. ', 2, 4, 2,],
      ['    是啊,父王正值春秋鼎盛,若被人有心人传播了谣言,怕是对我们冬天的军事行动有诸多不利. ', 1, 2, 2],
      ['    然而,最近城中确实患病者众多,荀令君前不久也病倒了,府中军中患病者也是数不胜数. ', 2, 4, 2],
      ['    (听到这个消息,你自然是想去设身处地的看看病情蔓延情况,你决定...) ', 1, 2, 2 , [Listdata.listitem1,['去军营探访','去城中药铺探访','去探访父王' ]]]
   ],
    //普通模式
    [
      ['    故事开始于建安十七年,八月。 ', 0, 0, 2],
      ['    故事开始于建安十七年,八月。 ', 0, 0, 2],
      ['    叶城,在竣工不久的铜雀台旁,身为曹家大公子,曹植,字子桓,你正在与好友兼门客的吴质,朱烁一行正在城中巡视. ', 0, 0, 2],
      ['    大公子,你是否记得前一阵子,主上的宴会上来了一个不速之客? ', 2, 4, 2],
      ['    你是说,那个已经被主上斩了的妖道? ', 2, 3, 2],
      ['    主上让我接替了校师府的很多职责,而此事主上已经派我前去彻查. ', 2, 3, 2],
      ['    话说最近父王的头痛病愈加严重,莫非是与这个妖道有关? ', 1, 2, 2],
      ['    这个不能肯定,但是现在这个阶段,我们必须杜绝这种谣言在城中散播,避免动摇军心. ', 2, 4, 2,],
      ['    是啊,父王正值春秋鼎盛,若被人有心人传播了谣言,怕是对我们冬天的军事行动有诸多不利. ', 1, 2, 2],
      ['    然而,最近城中确实患病者众多,荀令君前不久也病倒了,府中军中患病者也是数不胜数. ', 2, 4, 2],
      ['    (听到这个消息,你自然是想去设身处地的看看病情蔓延情况,你决定...) ', 1, 2, 2 , [Listdata.listitem1,['去军营探访','去城中药铺探访','去探访父王' ]]]
    ],
    //困难模式
    [
      ['    故事开始于建安十七年,八月。 ', 0, 0, 2],
      ['    故事开始于建安十七年,八月。 ', 0, 0, 2],
      ['    叶城,在竣工不久的铜雀台旁,身为曹家大公子,曹植,字子桓,你正在与好友兼门客的吴质,朱烁一行正在城中巡视. ', 0, 0, 2],
      ['    大公子,你是否记得前一阵子,主上的宴会上来了一个不速之客? ', 2, 4, 2],
      ['    你是说,那个已经被主上斩了的妖道? ', 2, 3, 2],
      ['    主上让我接替了校师府的很多职责,而此事主上已经派我前去彻查. ', 2, 3, 2],
      ['    话说最近父王的头痛病愈加严重,莫非是与这个妖道有关? ', 1, 2, 2],
      ['    这个不能肯定,但是现在这个阶段,我们必须杜绝这种谣言在城中散播,避免动摇军心. ', 2, 4, 2,],
      ['    是啊,父王正值春秋鼎盛,若被人有心人传播了谣言,怕是对我们冬天的军事行动有诸多不利. ', 1, 2, 2],
      ['    然而,最近城中确实患病者众多,荀令君前不久也病倒了,府中军中患病者也是数不胜数. ', 2, 4, 2],
      ['    (听到这个消息,你自然是想去设身处地的看看病情蔓延情况,你决定...) ', 1, 2, 2 , [Listdata.listitem1,['去军营探访','去城中药铺探访','去探访父王' ]]]
    ],
  ];

  static const List listitem1=[ 
    //去军营探访
    [
      ['    我们就去军营看看吧. ', 1, 2, 2],
      ['    我们就去军营看看吧. ' , 1, 2, 2],
      ['    好,我们趁天色正早,赶紧去看看吧. ', 2, 3, 2],
      ['    你们一行来到了城郊的军营,却发现已有一位公子先行抵达,原来是体恤军心的三弟曹丕公子. ', 0, 2, 3],
      ['    为弟见过五官中郎将大哥. ', 2, 1, 3],
      ['    三弟体恤士卒,亲自为士卒排解疾病,大哥自愧不如. ', 1, 2, 3],
      ['    大哥言重了,在下也是为将士略尽绵薄之力而已. ', 2, 1, 3],
      ['    看到三弟已经在处理这边的疾病,而且军营里的疾病已经得到了控制,你和曹丕公子寒暄了几句就离开了. ', 0, 1, 3],
      ['    大公子,还是先去魏王府上探问探问吧. ', 2, 4, 3],
      ['    好的,那就遵从吴先生所言. ', 1, 2, 3],
      ['    你和吴质,朱烁等人一同回到府中. 经过通报,你独自来到了父亲的屋子里. ', 0, 5, 1],
      ['    植儿,你来了. ', 2, 5, 1],
      ['    你给父亲递了一碗草药,好生照顾父亲. ', 0, 5, 1],
      ['    我们冬天还要南下,磨刀不误砍柴功,植儿你可别忘了休养,也别忘了难得的天伦之乐. ', 2, 5, 1],
      ['    和父亲闲聊几句,听到天伦之乐,你突然想到下午和甄娘在铜雀台后面的花园里有约. ', 0, 5, 1],
      ['    父王暂且好好休养,儿臣已经把事情吩咐安排下去了. ', 1, 2, 1],
      ['    儿臣还要和朱烁去巡查城里的疫病情况,儿臣先告退了. ', 1, 2, 1],
      ['    为父听闻疫病已经形势严峻,植儿小心别被感染,多多保重. ', 2, 5, 1],
      ['    和吴质,朱烁一行巡查完了叶城,你们回到府中吃午饭 . ', 0, 5, 4],
      ['    一进入饭厅,你就看到司马懿先生坐在窗边沉思 . ', 0, 5, 4],
      ['    臣参见五官中郎将 . ', 2, 6, 4],
      ['    (司马懿是你的老师兼好友,和你的关系自然是极好的,于是你觉得在这里应该....) ', 1, 2, 4, [Listdata.listitem2,['恭敬的回应','轻松地回应' ]]],
    ],
    //去城中药铺探访
    [
      ['    我们就去附近的药店看看情况,防止疫病影响到居民生活. ' , 1, 2, 2],
      ['    我们就去附近的药店看看情况,防止疫病影响到居民生活. ' , 1, 2, 2],
      ['    嗯,附近的药铺早已人满为患,也不知道满府君有没有加大秩序维护的力度...', 2, 4, 2],
      ['    药铺里果然是摩肩接踵,显然是满府君已经下达了命令,在士卒们的管理下,药房井然有序. ', 0, 2, 2],
      ['    你和吴质等人确认了药材进货来源以及售价之后,了解了一下民意就离开了. ', 0, 3, 2],
      ['    大公子,还是先去魏王府上探问探问吧. ', 2, 4, 2],
      ['    好的,那就遵从吴先生所言. ', 1, 2, 2],
      ['    你和吴质,朱烁等人一同回到府中. 经过通报,你独自来到了父亲的屋子里. ', 0, 5, 1],
      ['    植儿,你来了. ', 2, 5, 1],
      ['    你给父亲递了一碗草药,好生照顾父亲. ', 0, 5, 1],
      ['    我们冬天还要南下,磨刀不误砍柴功,植儿你可别忘了休养,也别忘了难得的天伦之乐. ', 2, 5, 1],
      ['    和父亲闲聊几句,听到天伦之乐,你突然想到下午和甄娘在铜雀台后面的花园里有约. ', 0, 5, 1],
      ['    父王暂且好好休养,儿臣已经把事情吩咐安排下去了. ', 1, 2, 1],
      ['    儿臣还要和朱烁去巡查城里的疫病情况,儿臣先告退了. ', 1, 2, 1],
      ['    为父听闻疫病形势严峻,植儿小心别被感染,多多保重. ', 2, 5, 1],
      ['    和吴质,朱烁一行巡查完了叶城,你们回到府中吃午饭 . ', 0, 5, 4],
      ['    一进入饭厅,你就看到司马懿先生坐在窗边沉思. ', 0, 5, 4],
      ['    臣参见五官中郎将. ', 2, 6, 4],
      ['    (司马懿是你的老师兼好友,和你的关系自然是极好的,于是你觉得在这里应该....) ', 1, 2, 4, [Listdata.listitem2,['恭敬的回应','轻松地回应' ]]],
    ],
    //去探访父王
    [
      ['    听说父王的病情没有好转,我们先回府上看望一阵吧? ', 1, 2, 2],
      ['    听说父王的病情没有好转,我们先回府上看望一阵吧? ', 1, 2, 2],
      ['    好吧,反正今天也没有太重的巡查任务,我们这就回府. ', 2, 4, 2],
      ['    你和吴质,朱烁等人一同回到府中. 经过通报,你独自来到了父亲的.屋子里 ', 0, 5, 1],
      ['    植儿,你来了. ', 2, 5, 1],
      ['    你给父亲递了一碗草药,好生照顾父亲. ', 0, 5, 1],
      ['    我们冬天还要南下,磨刀不误砍柴工,植儿你可别忘了休养,也别忘了难得的天伦之乐. ', 2, 5, 1],
      ['    和父亲闲聊几句,听到天伦之乐,你突然想到下午和甄娘在铜雀台后面的花园里有约. ', 0, 5, 1],
      ['    父王暂且好好休养,儿臣已经把事情吩咐安排下去了. ', 1, 2, 1],
      ['    儿臣还要和朱烁去巡查城里的疫病情况,儿臣先告退了. ', 1, 2, 1],
      ['    为父听闻疫病已经形势严峻,植儿小心别被感染,多多保重. ', 2, 5, 1],
      ['    和吴质,朱烁一行巡查完了叶城,你们回到府中吃午饭. ', 0, 5, 4],
      ['    一进入饭厅,你就看到司马懿先生坐在窗边沉思. ', 0, 5, 4],
      ['    臣参见五官中郎将. ', 2, 6, 4],
      ['    (司马懿是你的老师兼好友,和你的关系自然是极好的,于是你觉得在这里应该....) ', 1, 2, 4, [Listdata.listitem2,['恭敬的回应','轻松地回应' ]]],

    ],
  ];

  static const List listitem2=[
    //恭敬的回应
    [
          ['    见过师长仲达先生. ', 1, 2, 4],
          ['    见过师长仲达先生. ', 1, 2, 4],
          ['    臣跟随中郎将也有些时日,大公子天资聪慧,必在日后能成就一番大事业. ', 2, 6, 4],
          ['    是啊,大公子在仲达先生的教诲下,近些年进步飞速.然而主上却一直对三公子更为青睐... ', 2, 3, 4],
          ['    朱烁兄,慎言! ', 2, 4, 4],
          ['    嗬,朱烁兄还是那样的心直口快! ', 2, 6, 4],
          ['    不过吴质兄说的也有道理,不知道子桓公子是怎么看待主公的态度? ', 2, 6, 4],
          ['    (你准备如何回答仲达先生呢?) ', 1, 2, 4,[Listdata.listitem3,['既然父王这么认为,儿臣也只能顺其自然吧','儿臣自然是希望得到父王的高看' ]]],

    ],
    //轻松地回应
    [
          ['    (微笑)仲达,你我何必行此虚礼? ', 1, 2, 4],
          ['    (微笑)仲达,你我何必行此虚礼? ', 1, 2, 4],
          ['    臣跟随中郎将也有些时日,大公子天资聪慧,必在日后能成就一番大事业. ', 2, 6, 4],
          ['    是啊,大公子在仲达先生的教诲下,近些年进步飞速.然而主上却一直对三公子更为青睐... ', 1, 3, 4],
          ['    朱烁兄,慎言! ', 2, 4, 4],
          ['    嗬,朱烁兄还是那样的心直口快... ', 2, 6, 4],
          ['    不过吴质兄说的也有道理,不知道子桓公子是怎么看待主公的态度? ', 2, 6, 4],
          ['    (你准备如何回答仲达先生呢?)  ', 1, 2, 4,[Listdata.listitem3,['既然父王这么认为,儿臣也只能顺其自然吧','儿臣自然是希望得到父王的高看' ]]],
    ]

  ];

  static const List listitem3=[
     //既然父王这么认为,儿臣也只能顺其自然吧
     [
          ['    袁绍和刘表的教训还在眼前,在这个天下未定的节骨眼上,我们兄弟切不能同室操戈. ', 1, 2, 4],
          ['    袁绍和刘表的教训还在眼前,在这个天下未定的节骨眼上,我们兄弟切不能同室操戈. ', 1, 2, 4],
          ['    如果父王真的一意孤行,恐怕儿臣也无能为力. ', 1, 2, 4],
          ['    子桓公子,手足之情对你来说,真的那么重要吗? ', 2, 6, 4],
          ['    我们曹氏一族平定中原,固然官渡一役是重要转折. ', 1, 2, 4],
          ['    然而袁氏兄弟阋墙造成袁家迅速衰败,刘氏兄弟同室操戈导致荆州拱手让人,才是最终的胜读关键所在.  ', 1, 2, 4],
          ['    若是我们兄弟无法勠力同心,怎能接手父王的天下?  ', 1, 2, 4],
          ['    (司马懿听到你的回答之后,也不点头,也不摇头,淡淡的笑了一下)  ', 2, 6, 4],
          ['    大公子能有自己的想法,总归是令在下满意的.  ', 2, 6, 4],
          ['    别聊这么多了,我们赶紧用饭吧.  ', 2, 4, 4],
          ['    那就依吴质兄所言,我们边吃边聊吧.  ', 1 ,2, 4],
          ['    饭桌准备的十分丰盛,你和吴质朱烁忙了一上午,确实有些饿了.  ', 0, 4, 5],
          ['    大家有说有笑,气氛很融洽,愉快的吃完了午饭.  ', 0, 4, 5],
          ['    用过午饭后,你和朋友们告别,来到后花园,等待甄娘前来赴约.  ', 0, 4, 6],
          ['    (甄娘平时都不会人让人久等,然而甄娘今天却出乎意料的失约了,对此,你觉得...) ', 1, 2, 6,[Listdata.listitem4,['她根本没有把约会放在心上!','她会不会有什么情况?' ]]],

     ],
     //儿臣自然是希望得到父王的高看
     [
          ['    在下身为长兄,自然应当担负起家族的重担.  ', 1, 2, 4],
          ['    在下身为长兄,自然应当担负起家族的重担.  ', 1, 2, 4],
          ['    若有些人有不臣之心,那在下也只能大义灭亲了.  ', 1, 2, 4],
          ['    (司马懿听到你的回答之后,也不点头,也不摇头,淡淡的笑了一下)  ', 2, 6, 4],
          ['    大公子能有自己的想法,总归是令在下满意的.  ', 2, 6, 4],
          ['    别聊这么多了,我们赶紧用饭吧.  ',2, 4, 4],
          ['    那就依吴质兄所言,我们边吃边聊吧.  ', 1, 2, 4],
          ['    饭桌准备的十分丰盛,你和吴质朱烁忙了一上午,确实有些饿了.  ', 0, 4, 5],
          ['    大家有说有笑,气氛很融洽,愉快的吃完了午饭.  ', 0, 4, 5],
          ['    用过午饭后,你和朋友们告别,来到后花园,等待甄娘前来赴约.  ', 0, 4, 6],
          ['    (甄娘平时都不会人让人久等,然而甄娘今天却出乎意料的失约了,对此,你觉得...) ', 1, 2, 6,[Listdata.listitem4,['她根本没有把约会放在心上!','她会不会有什么情况?' ]]],
     ],

   ];

  static const List listitem4=[
    //她根本没有把约会放在心上!
    [ 
      ['    你心里有点生气,心想待会见到甄娘要发发脾气,责怪一番.  ', 0, 2, 6],
      ['    你心里有点生气,心想待会见到甄娘要发发脾气,责怪一番.  ', 0, 2, 6],
      ['    就在此时,你看见三弟曹丕和弟妹崔氏一起牵着手,来到花园里游玩.  ', 0, 2, 6],
      ['    大哥午安.  ', 2, 1, 6],
      ['    嗨,三弟和弟妹出来玩呢?.  ', 1, 2, 6],
      ['    真是琴瑟和谐,如胶似漆啊.  ', 1, 2, 6],
      ['    哪有,不过是这风和日丽的下午,大哥竟然没和嫂子在一起?  ', 2, 1, 6],
      ['    甄娘他可能身体有恙,最近城里的疫病非常严重呢...  ', 1, 2, 6],
      ['    你笑了笑,指了下子建手上的诗集.  ', 0, 1, 6],
      ['    不过三弟最近可有什么上佳之作?  ', 1, 2, 6],
      ['    哪有,为弟肚子里的这点墨水哪里比的上大哥啊..  ', 2, 1, 6],
      ['    既然今日天公作美,不妨你们兄弟俩各在这园中题诗一首?  ', 2, 7, 6],
      ['    好啊好啊,最近军务繁忙,很久没有和大哥一起吟诗作乐了!  ', 2, 1, 6],
      ['    (你还没来得及回答弟妹,三弟就笑着同意了)  ',1, 2, 6],
      ['    于是你和三弟取了笔墨,三弟命人摆了蔬果清酒,你们在花园中一边闲聊,一边提笔作诗  ',0, 1, 6],
      ['    你们聊了一些有趣的轶事,不知不觉,天色已晚.  ',0, 1, 6],
      ['    可是甄娘竟真的未前来赴约.....  ',0, 1, 6],
      ['    望着落日,触景生情,你一篇 <<秋胡行>> 一挥而就.  ',0, 1, 6],
      ['    朝与佳人期,日夕殊不知. 佳肴不尝,旨酒停杯.  ',2, 7, 6],
      ['    寄言飞鸟,告余不能. 俯折兰英,仰结桂枝. ',2, 7, 6],
      ['    佳人不在,结之为何? ',2, 7, 6],
      ['    (扫视了一下诗文)咦?大哥是和甄娘有约,甄娘竟然爽约了? ',2, 1, 6],
      ['    哎...和三弟一同饮宴吟诗很愉快,可惜不能和甄娘一起... ',1, 2, 6],
      ['    听闻这次疫病,府中女眷也有患病的,大哥要不要赶紧去看看? ',2, 1, 6],
      ['    你也担忧这甄娘会不会患病,于是和三弟和弟妹告辞了. ',0, 1, 6],
      ['    刚刚进屋,你就闻到了一股浓郁的中药味.自己和三弟的猜测果然是被证实了.  ',0, 1, 8],
      ['    甄娘?  ',1, 2, 8],
      ['    夫君?  ',2, 0, 8],
      ['    听到你进门,甄娘从床上坐了起来 .  ',0, 0, 8],
      ['    今天中午妾身刚要赴约,突然头疼难忍,来不及告知夫君,请夫君责罚.  ',2, 0, 8],
      ['    看到她脸色苍白,你也不忍心追究他爽约的事.  ',0, 0, 8],
      ['    明天铜狄府上会送来一批新的侍女,还望夫君去堂上相迎.  ',1, 0, 8],
      ['    对于这件事,你也有所耳闻,但是没怎么放在心上.  ',0, 0, 8],
      ['    这件事吴质均替我办妥了就是,还望甄娘你多注意健康.  ',1, 2, 8],
      ['    可是,旭儿呢?  ',1, 2, 8],
      ['    旭儿一早就去照顾父王了,妾身这边自己能照看,不需要旭儿担心.',2, 0, 8],
      ['    夫君还是小心为妙,等妾身病好了再到妾身这里来.',2, 0, 8],
      ['    听闻甄娘此言,你决定....',2, 0, 8,[Listdata.listitem5,['留下照顾甄娘','回自己屋里' ]]],
     ],
    //她会不会有什么情况?
    [ 
      ['    她可能是突然有什么事不能抽身吧.  ', 1, 2, 6],
      ['    她可能是突然有什么事不能抽身吧.  ', 1, 2, 6],
      ['    就在此时,你看见三弟曹丕和弟妹崔氏一起牵着手,来到花园里游玩.  ', 0, 2, 6],
      ['    大哥午安.  ', 2, 1, 6],
      ['    嗨,三弟和弟妹出来玩呢?  ', 1, 2, 6],
      ['    真是琴瑟和谐,如胶似漆啊.  ', 1, 2, 6],
      ['    哪有,不过是这风和日丽的下午,大哥竟然没和嫂子在一起?  ', 2, 1, 6],
      ['    甄娘他可能身体有恙,最近城里的疫病非常严重呢...  ', 1, 2, 6],
      ['    你笑了笑,指了下子建手上的诗集.  ', 0, 1, 6],
      ['    不过三弟最近可有什么上佳之作?  ', 1, 2, 6],
      ['    哪有,为弟肚子里的这点墨水哪里比的上大哥啊.  ', 2, 1, 6],
      ['    既然今日天公作美,不妨你们兄弟俩各在这园中题诗一首?  ', 2, 7, 6],
      ['    好啊好啊,最近军务繁忙,很久没有和大哥一起吟诗作乐了!  ', 2, 1, 6],
      ['    (你还没来得及回答弟妹,三弟就笑着同意了)  ',1, 2, 6],
      ['    于是你和三弟去了笔墨,三弟命人摆了蔬果清酒,你们在花园中一边闲聊,一边提笔作诗.  ',0, 1, 6],
      ['    你们聊了一些有趣的轶事,不知不觉,天色已晚.  ',0, 1, 6],
      ['    可是甄娘竟真的未前来赴约....  ',0, 1, 6],
      ['    望着落日,触景生情,你一篇 <<秋胡行>> 一挥而就.  ',0, 1, 6],
      ['    朝与佳人期,日夕殊不知. 佳肴不尝,旨酒停杯.  ',2, 7, 6],
      ['    寄言飞鸟,告余不能. 俯折兰英,仰结桂枝. ',2, 7, 6],
      ['    佳人不在,结之为何? ',2, 7, 6],
      ['    (扫视了一下诗文)咦?大哥是和甄娘有约,甄娘竟然爽约了? ',2, 1, 6],
      ['    哎...和三弟一统饮宴吟诗很愉快,可惜不能和甄娘一起... ',1, 2, 6],
      ['    听闻这次疫病,府中女眷也有患病的,大哥要不要赶紧去看看? ',2, 1, 6],
      ['    你也担忧这甄娘会不会患病,于是和三弟和弟妹告辞了. ',0, 1, 6],
      ['    刚刚进屋,你就闻到了一股浓郁的中药味.自己和三弟的猜测果然是被证实了.  ',0, 1, 8],
      ['    甄娘?  ',1, 2, 8],
      ['    夫君?  ',2, 0, 8],
      ['    听到你进门,甄娘从床上坐了起来.  ',0, 0, 8],
      ['    今天中午妾身刚要赴约,突然头疼难忍,来不及告知夫君,请夫君责罚.  ',2, 0, 8],
      ['    看到她脸色苍白,你也不忍心追究他爽约的事.  ',0, 0, 8],
      ['    明天铜狄府上会送来一批新的侍女,还望夫君去堂上相迎.  ',0, 0, 8],
      ['    对于这件事,你也有所耳闻,但是没怎么放在心上.  ',0, 0, 8],
      ['    这件事吴质均替我办妥了就是,还望甄娘你多注意健康.  ',1, 2, 8],
      ['    可是,旭儿呢?  ',1, 2, 8],
      ['    旭儿一早就去照顾父王了,妾身这边自己能照看,不需要旭儿担心.',2, 0, 8],
      ['    夫君还是小心为妙,等妾身病好了再到妾身这里来.',2, 0, 8],
      ['    听闻甄娘此言,你决定.....',2, 0, 8,[Listdata.listitem5,['留下照顾甄娘','回自己屋里' ]]],
    ],

   ];

  static const List listitem5=[ 
      //留下照顾甄娘
      [
        ['   不用了,夫君不放心,还是我来照顾你吧.  ',1, 2, 8],
        ['   不用了,夫君我不放心,还是我来照顾你吧.  ',1, 2, 8],
        ['   (不等甄娘开口),让丫鬟把膳食端进来,我今天就在甄娘这用膳了  ',1, 2, 8],
        ['   饭后,吴质,朱烁都来问候了甄娘,曹丕跟弟妹听闻甄娘患病,也都前来探问.  ',0, 2, 8],
        ['   母亲卞夫人也亲自送来了药材,可见甄娘在府中的人缘极佳.  ',0, 2, 8],
        ['   你一边给甄娘看自己下午写的<< 秋胡行 >>,一边喂她吃药.  ',0, 2, 8],
        ['   照顾完甄娘之后,你便回屋休息了.  ',0, 2, 8],
        ['   回屋稍作歇息之后.你对城中的疫病还是不太放心,便和朱烁,吴质上街继续巡查  ',0, 2, 2],
        ['    大公子,你是否记得前一阵子,主上的宴会上来了一个不速之客? ', 2, 4, 2],
        ['    你是说,那个已经被主上斩了的妖道? ', 2, 3, 2],
        ['    主上让我接替了校师府的很多职责,而此事主上已经派我前去彻查. ', 2, 3, 2],
        ['    话说最近父王的头痛病愈加严重,莫非是与这个妖道有关? ', 1, 2, 2],
        ['    这个不能肯定,但是现在这个阶段,我们必须杜绝这种谣言在城中散播,避免动摇军心. ', 2, 4, 2,],
        ['    是啊,父王正值春秋鼎盛,若被人有心人传播了谣言,怕是对我们冬天的军事行动有诸多不利. ', 1, 2, 2],
        ['    然而,最近城中确实患病者众多,荀令君前不久也病倒了,府中军中患病者也是数不胜数. ', 2, 4, 2],
        ['    (听到这个消息,你自然是想去设身处地的看看病情蔓延情况,你决定...) ', 1, 2, 2 , ['reset',['去军营探访','去城中药铺探访','去探访父王' ]]]
      ],
      //回自己屋里
      [
        ['    回屋稍作歇息之后.你对城中的疫病还是不太放心,便和朱烁,吴质上街继续巡查  ',0, 2, 2],
        ['    回屋稍作歇息之后.你对城中的疫病还是不太放心,便和朱烁,吴质上街继续巡查.  ',0, 2, 2],
        ['    大公子,你是否记得前一阵子,主上的宴会上来了一个不速之客? ', 2, 4, 2],
        ['    你是说,那个已经被主上斩了的妖道? ', 2, 3, 2],
        ['    主上让我接替了校师府的很多职责,而此事主上已经派我前去彻查. ', 2, 3, 2],
        ['    话说最近父王的头痛病愈加严重,莫非是与这个妖道有关? ', 1, 2, 2],
        ['    这个不能肯定,但是现在这个阶段,我们必须杜绝这种谣言在城中散播,避免动摇军心. ', 2, 4, 2,],
        ['    是啊,父王正值春秋鼎盛,若被人有心人传播了谣言,怕是对我们冬天的军事行动有诸多不利. ', 1, 2, 2],
        ['    然而,最近城中确实患病者众多,荀令君前不久也病倒了,府中军中患病者也是数不胜数. ', 2, 4, 2],
        ['    (听到这个消息,你自然是想去设身处地的看看病情蔓延情况,你决定...) ', 1, 2, 2 , ['reset',['去军营探访','去城中药铺探访','去探访父王' ]]]
      ],

    ];
}