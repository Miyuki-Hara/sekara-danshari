require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
    sleep 0.1
  end

  describe '断捨離記録登録' do
    context '断捨離記録の登録ができるとき' do
      it '全ての入力事項があれば登録できる' do
        expect(@item).to be_valid
      end
      it 'categoryが---以外であれば登録できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it 'let_go_wayが---以外であれば登録できる' do
        @item.let_go_way_id = 2
        expect(@item).to be_valid
      end
      it 'let_go_reasonが---以外であれば登録できる' do
        @item.let_go_reason_id = 2
        expect(@item).to be_valid
      end
      it 'resultは---でも登録できる' do
        @item.result_id = 1
        expect(@item).to be_valid
      end
      it 'commentはなくても登録できる' do
        @item.comment = ''
        expect(@item).to be_valid
      end
    end

    context '断捨離記録の登録ができないとき' do
      it 'userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'categoryが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'categoryが---だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'let_go_wayが空だと登録できない' do
        @item.let_go_way_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Let go way can't be blank")
      end
      it 'let_go_wayが---だと登録できない' do
        @item.let_go_way_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Let go way must be other than 1')
      end
      it 'let_go_reasonが空だと登録できない' do
        @item.let_go_reason_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Let go reason can't be blank")
      end
      it 'let_go_reasonが---だと登録できない' do
        @item.let_go_reason_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Let go reason must be other than 1')
      end
    end
  end
end
