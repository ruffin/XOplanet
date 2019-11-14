class BruceController < ApplicationController
  def index
    @all_items = JSON.parse(HTTP.get('https://ssd-api.jpl.nasa.gov/sentry.api?ip-min=1e-4').body)['data']
    @selected = params[:des].present? ? @all_items.find { |i| i['des'] == params[:des] } : @all_items.sample
    @selected_des = @selected['des']
    @item_req = JSON.parse(HTTP.get("https://ssd-api.jpl.nasa.gov/sentry.api?des=#{@selected_des}").body)['summary']
    max_prob = [@item_req['ps_cum'].to_f, @item_req['ps_max'].to_f].max
    @cat = category_for(max_prob)
  end

  def category_for(max_prob)
    case max_prob
    when -Float::INFINITY..-5.5
      'low'
    when -5.5..-5.0
      'med'
    when -5.0..-4.5
      'medhigh'
    when -4.5..-4.0
      'high'
    else
      'death'
    end
  end
end
