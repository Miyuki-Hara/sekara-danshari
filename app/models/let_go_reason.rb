class LetGoReason < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '不要になった' },
    { id: 3, name: '貰い物だけど使わない' },
    { id: 4, name: '使い勝手が悪い' },
    { id: 5, name: '壊れた' },
    { id: 6, name: '入れ替え' },
    { id: 7, name: '明らかにゴミ' },
    { id: 8, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
