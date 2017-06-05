# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# u = User.new
# u.email = "admin@test.com"           # 可以改成自己的 email
# u.password = "123456"                # 最少要六码
# u.password_confirmation = "123456"   # 最少要六码
# u.is_admin = true
# u.save

# 新增 admin 帳號  User #
  if User.find_by(email: 'admin@rails.com').nil?
    u = User.new
#    u.name = '測試管理員'
    u.email = 'admin@rails.com'
    u.nickname = '測試管理員'
    u.password = '111111'
    u.password_confirmation = '111111'
    u.is_admin = true
    u.save
    puts '創建管理員*1'
  else
    puts '已創建過此帳號，不重複新增。'
  end

  # 新增 user 帳號  User #
  if User.find_by(email: 'user@rails.com').nil?
    u = User.new
#    u.name = '測試管理員'
    u.email = 'user@rails.com'
    u.nickname = '測試管理員'
    u.password = '111111'
    u.password_confirmation = '111111'
    u.is_admin = false
    u.save
    puts '創建一般用戶*1'
  else
    puts '已創建過此帳號，不重複新增。'
  end

  #产品资料
  Product.create!(
#  brand_id: 1,
  title: "权力的游戏-国王之手",
  description: "权力的游戏-国王之手，规则简单，画风犀利，轻度策略",
  price: 300,
#  stock: 5,
  quantity: 5,
  image: open("https://ws4.sinaimg.cn/large/006tNbRwgy1fgashd7q13j309q0bf7ai.jpg"),
#  category_id: 1,
#  can_sell: true
  )

Product.create!(
#  brand_id: 1,
  title: "Twlight Struggle（冷战热斗）",
  description: "以美苏冷战为背景，玩家模拟美苏其中的一方，行走在核战危机的边缘，在全球范围内拓展自己的影响力",
  price: 300,
#  stock: 5,
  quantity: 5,
  image: open("https://ws2.sinaimg.cn/large/006tNbRwgy1fgasnhlmb2j30m80m8gzm.jpg"),
#  category_id: 2,
#  can_sell: true
  )

Product.create!(
#  brand_id: 1,
  title: "Wonders:Duel(七大奇迹:对决)",
  description: "文明背景的建设类游戏，曾经一度名列BGG游戏榜单前十",
  price: 300,
#  stock: 5,
  quantity: 5,
  image: open("https://ws4.sinaimg.cn/large/006tNbRwgy1fgasqvoz9kj30k00jzqpp.jpg"),
#  category_id: 3,
#  can_sell: true
  )

  Product.create!(
  #  brand_id: 1,
    title: "Babel(通天塔)",
    description: "最佳分手游戏",
    price: 300,
  #  stock: 5,
    quantity: 5,
    image: open("https://ws2.sinaimg.cn/large/006tNbRwgy1fgat3ncl2lj30dv0dwna0.jpg"),
  #  category_id: 3,
  #  can_sell: true
    )
