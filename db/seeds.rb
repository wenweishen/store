# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ title: 'Star Wars' }, { title: 'Lord of the Rings' }])
#   Character.create(title: 'Luke', movie: movies.first)

# 新增 admin 帳號  User #
  if User.find_by(email: 'admin@rails.com').nil?
    u = User.new
#    u.title = '測試管理員'
    u.email = 'admin@rails.com'
    u.nickname = '测试管理员'
    u.password = '111111'
    u.password_confirmation = '111111'
    u.is_admin = true
    u.save
    puts '创建管理員*1'
  else
    puts '已创建过此账号，不重复新增。'
  end

  # 新增 user 帳號  User #
  if User.find_by(email: 'user@rails.com').nil?
    u = User.new
#    u.title = '測試管理員'
    u.email = 'user@rails.com'
    u.nickname = '测试用户'
    u.password = '111111'
    u.password_confirmation = '111111'
    u.is_admin = false
    u.save
    puts '创建一般用戶*1'
  else
    puts '已创建过此账号，不重复新增。'
  end



  # 新增幣別  Currency #
    Currency.create!(
      title: '人民币',
      symbol: '¥',
      rate: 0.23
    )

    Currency.create!(
      title: '新台幣',
      symbol: 'NT$',
      rate: 1
    )

    Currency.create!(
      title: 'Euro',
      symbol: '€',
      rate: 0.03
    )

    Currency.create!(
      title: 'US Dollar',
      symbol: '$',
      rate: 0.03
    )

    Currency.create!(
      title: '日円',
      symbol: '¥',
      rate: 3.69
    )

    puts '创建初始货币*5：人民币、新台币、欧元、美金、日圆'

  # 新增廣告  Intro #

    # 1
    Intro.create!(
      title: 'J&A SELECT',
      content: '講究生活裡細微的美好，就是我們的選物精神。',
      link: '#'
    )

    # 2
    Intro.create!(
      title: '桌上風景',
      content: '實用與美學兼具，重新定義你的辦公日常。',
      link: '#'
    )

    # 3
    Intro.create!(
      title: '生活質感',
      content: '讓風格成為日常的一部分。',
      link: '#'
    )

    # 4
    Intro.create!(
      title: '經典單品',
      content: '從隨身物件展露你的獨到品味',
      link: '#'
    )

    puts '创建广告*4'



  # 新增类型  Category #
    CategoryGroup.create!(
      title: '家人&朋友'
    )

    CategoryGroup.create!(
      title: '同学&同事'
    )

    CategoryGroup.create!(
      title: '公司文化&同行交流'
    )

    puts '创建类型*3：家人&朋友、同学&同事、公司文化&同行交流'

  # 新增分類  Category #
    # 家人&朋友
    # 1
    Category.create!(
      category_group_id: 1,
      title: '成长'
    )

    # 2
    Category.create!(
      category_group_id: 1,
      title: '生日'
    )

    # 3
    Category.create!(
      category_group_id: 1,
      title: '家庭大事记'
    )

    puts '创建「家人&朋友」分类*3：成长、生日、家庭大事记'

    # 同学&同事
    # 4
    Category.create!(
      category_group_id: 2,
      title: '高中'
    )

    # 5
    Category.create!(
      category_group_id: 2,
      title: '大学'
    )

    # 6
    Category.create!(
      category_group_id: 2,
      title: '糗事一箩筐'
    )

    puts '创建「同学&同事」分类*3：高中、大学、糗事一箩筐'

    # 公司文化&同行交流
    # 7
    Category.create!(
      category_group_id: 3,
      title: '团队建设'
    )
    # 8
    Category.create!(
      category_group_id: 3,
      title: '行业大事记'
    )

    puts '创建「公司文化&同行交流」分类*2：团队建设、行业大事记'




# 新增商品  Product #
Product.create!(
   title: "权力的游戏-国王之手",
   description: "权力的游戏-国王之手，规则简单，画风犀利，轻度策略",
   price: 300,
   quantity: 5,
   category_id: 1,
   is_hidden: false
#   image: open("https://ws4.sinaimg.cn/large/006tNbRwgy1fgashd7q13j309q0bf7ai.jpg"),
)

Product.create!(
   title: "Twlight Struggle（冷战热斗）",
   description: "以美苏冷战为背景，玩家模拟美苏其中的一方，行走在核战危机的边缘，在全球范围内拓展自己的影响力",
   price: 300,
   quantity: 5,
   category_id: 2,
   is_hidden: false
#   image: open("https://ws2.sinaimg.cn/large/006tNbRwgy1fgasnhlmb2j30m80m8gzm.jpg"),
)

 Product.create!(
   title: "Wonders:Duel(七大奇迹:对决)",
   description: "文明背景的建设类游戏，曾经一度名列BGG游戏榜单前十",
   price: 300,
   quantity: 5,
   category_id: 3,
   is_hidden: false
#   image: open("https://ws4.sinaimg.cn/large/006tNbRwgy1fgasqvoz9kj30k00jzqpp.jpg"),
)

   Product.create!(
     title: 'Babel(通天塔)',
     description: '最佳分手游戏',
     price: 300,
     quantity: 5,
     category_id: 1,
     is_hidden: false
#     image: open("https://ws2.sinaimg.cn/large/006tNbRwgy1fgat3ncl2lj30dv0dwna0.jpg"),
     )

  Product.create!(
    title: 'Babel(通天塔)',
    description: '最佳分手游戏',
    price: 300,
    quantity: 5,
    category_id: 1,
    is_hidden: false
#       image: open("https://ws2.sinaimg.cn/large/006tNbRwgy1fgat3ncl2lj30dv0dwna0.jpg"),
  )

  Product.create!(
    title: 'Tools to Liveby 手工皮革筆袋（大）',
    description: '
    天然植鞣皮革，會隨著時間與使用而逐漸產生色澤變化，隨著不同的使用者或是使用方式，會呈現不一樣的質感，這就是植鞣牛皮的迷人之處。
    ',
    price: 2500,
    quantity: 3,
    category_id: 2,
    is_hidden: false
  )

  Product.create!(
    title: 'Tools to Liveby X Vita Yang 明信片組',
    description: '
    Vita Yang，知名時尚插畫家。作品常見於 Harvey Nichols、HUMAN MADE、agnès b 等知名品牌，並長期與巴西 Vogue 雜誌合作。
    禮拜文房具首度與時尚插畫家 Vita Yang 推出聯名商品。以〈 7 DAYS 7 BOYS〉為主題，延伸出7個品項，10款限定商品，每樣都值得收藏!
    ',
    price: 300,
    quantity: 5,
    category_id: 3,
    is_hidden: false
  )

  Product.create!(
    title: 'Tools to Liveby  圓把剪刀（黑）',
    description: '
    使用日本不鏽鋼製造， 比例及造型都是最好的首選。自製的貼心小包裝，能保護刀刃，也以雷射雕刻了禮拜的 logo ，更適合當作禮物送給朋友。 同樣有霧黑與金色兩款，黑色款外層塗布一層鐵氟龍，裁剪膠帶時較不容易殘膠。附紙套包裝。
    ',
    price: 560,
    quantity: 10,
    category_id: 1,
    is_hidden: false
  )

  Product.create!(
    title: 'Tools to Liveby 復古拆信刀',
    description: '
    現在比較少人有使用拆信刀的習慣，但是建議大家不妨從這款平價的入門試試看，讓自己的步調放慢下來，去感受工具為生活所帶來的樂趣。使用方式:拇指與中指輕握拆信刀邊緣，食指輕壓刀刃，刀刃尖端可在信封背面封口一角挑出小缺孔，即可順勢劃開封口。
    ',
    price: 45,
    quantity: 10,
    category_id: 1,
    is_hidden: false
  )

  Product.create!(
    title: 'Tools to Liveby 隨行袋（L）',
    description: '
    《禮拜文房具》新款隨行袋，比曾經推出過的所有袋子尺寸更大了些，可舒適地手提也可帥氣地肩背，有深藍色與米白色兩款。隨行袋內側另有一個小口袋，可放置小物件，使用起來更加方便，逛街購物或隨時來個小旅行，都非常實用，是生活中的必備單品。
    ',
    price: 450,
    quantity: 15,
    category_id: 1,
    is_hidden: false
  )

  Product.create!(
    title: 'Tools to Liveby 隨行袋（S）',
    description: '
    《禮拜文房具》新推出的環保袋，此款袋型較小，可手提也可以斜肩揹，袋口部分有個黑色小扣子的設計，能夠保護袋內物品不易掉出。同樣是雙面圖案設計，一面是經典圖示，另一面印著我們很喜歡也一直是我們生活理念的 Quote  “Be refined, polite and wellspoken.” 。
    第一次選用藍色與灰色來製作，因為這兩種顏色給人沉穩且時尚的感覺，並且與我們日常生活的服飾容易搭配，很適合微旅行使用。
    ',
    price: 450,
    quantity: 8,
    category_id: 1,
    is_hidden: false
  )

  Product.create!(
    title: 'Tools to Liveby 手提肩揹兩用環保袋',
    description: '
    這一款我們自己稱它為「文青袋」，樣式比較中性，尺寸也大上許多！除了可以手提之外，側邊車縫了一條較長的揹帶，內容物太重時可肩揹。雙面的圖案設計，一面是禮拜文房具的經典圖標，另一面是插畫與文字設計。較薄的布料材質，方便平時收納在包包裡，外出或購物時取出使用。
    ',
    price: 300,
    quantity: 20,
    category_id: 1,
    is_hidden: false
  )

  Product.create!(
    title: 'Kaweco Liliput 迷你手帳型原子筆（平面）',
    description: '
    2014年的新商品，德國 KAWECO Liliput 迷你手帳型原子筆，以耐久耐用的黃銅材質所製作，總長度僅有9.6cm，黃銅筆身握在手裡溫潤的觸感讓人愛不釋手！
    貼心提醒：
    黃銅材質表面與空氣接觸後氧化屬於正常現象，保養以銅油擦拭即可恢復原本光澤。
    ',
    price: 2500,
    quantity: 20,
    category_id: 1,
    is_hidden: false
  )

  puts '創建商品*13'
