class RankingController < ApplicationController
  def have
    # Haveモデルをitem_idでグルーピングし、各グループのitem_idの多い順を取得する
    ranking = Have.group(:item_id).order('count_item_id desc').limit(10).count(:item_id)
    item_ids = ranking.keys
    @counts = ranking.values
    @items = Item.find(item_ids).sort_by{|o|
      item_ids.index(o.id)
    }
  end
  
  def want
    # Wantモデルをitem_idでグルーピングし、各グループのitem_idの多い順を取得する
    ranking = Want.group(:item_id).order('count_item_id desc').limit(10).count(:item_id)
    item_ids = ranking.keys
    @count = ranking.values
    @items = Item.find(item_ids).sort_by{|o|
      item_ids.index(o.id)
    }
  end
end
