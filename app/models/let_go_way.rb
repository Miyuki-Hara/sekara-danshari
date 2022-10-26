class LetGoWay < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '自治体に従って処分' },
    { id: 3, name: '処分業者に依頼' },
    { id: 4, name: '買取業者に依頼' },
    { id: 5, name: '譲渡' },
    { id: 6, name: '寄付' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
