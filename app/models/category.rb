class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '衣類・靴' },
    { id: 3, name: 'バッグ・アクセサリー・ファッション雑貨' },
    { id: 4, name: '家電' },
    { id: 5, name: '家具・インテリア' },
    { id: 6, name: 'ホビー・玩具・思い出の品' },
    { id: 7, name: '書籍・CD・DVD' },
    { id: 8, name: 'こども用品' },
    { id: 9, name: 'ストック品' },
    { id: 10, name: '生活雑貨' },
    { id: 11, name: '文具・工具' },
    { id: 12, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
