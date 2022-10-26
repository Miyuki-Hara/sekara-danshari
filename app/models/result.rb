class Result < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '手離しても問題なかった' },
    { id: 3, name: '手離したことを後悔した' },
    { id: 8, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items

end