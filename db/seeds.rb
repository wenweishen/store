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

# 新增类型  Category#
Category.create!(
  title: '家人朋友'
)

Category.create!(
  title: '同学同事'
)

Category.create!(
  title: '公司文化'
)

puts '创建类型*3：家人&朋友、同学&同事、公司文化&同行交流'

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
  title: 'Dixit（只言片语）',
  description: 'DIXIT是一款法国游戏，08年由法国游戏公司Libellud首先发行。这款游戏发行不久便备受瞩目。法国画家Marie Cardouat设计的卡牌画面精致可爱，规则简单却充满无限的乐趣。',
  price: 300,
  quantity: 5,
  category_id: 1,
  is_hidden: false
#       image: open("https://ws2.sinaimg.cn/large/006tNbRwgy1fgat3ncl2lj30dv0dwna0.jpg"),
)

puts '創建商品*5'
