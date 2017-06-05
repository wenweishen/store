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
  title: "HAY- J104单椅",
  description: "尺寸：宽57 x深47 x高73 /高高44.5厘米",
  price: 2020,
#  stock: 5,
  quantity: 5,
  image: open("https://ws4.sinaimg.cn/large/006tKfTcgy1ffug7u3qq1j30b40gomxq.jpg"),
#  category_id: 1,
#  can_sell: true
  )

Product.create!(
#  brand_id: 1,
  title: "HAY- Slit圆型几何边几",
  description: "尺寸：直径45 x高35.5厘米",
  price: 1795,
#  stock: 5,
  quantity: 5,
  image: open("https://ws1.sinaimg.cn/large/006tKfTcgy1ffug88zz8qj30m80eu3z3.jpg"),
#  category_id: 2,
#  can_sell: true
  )

Product.create!(
#  brand_id: 1,
  title: "HAY- Revolver旋转吧台椅",
  description: "高型：直径34×高76厘米",
  price: 2020,
#  stock: 5,
  quantity: 5,
  image: open("https://ws4.sinaimg.cn/large/006tKfTcgy1ffug8g1srej30m80et0tl.jpg"),
#  category_id: 3,
#  can_sell: true
  )
