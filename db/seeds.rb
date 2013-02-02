# encoding: utf-8

cafes = {
  '阪急大井町ガーデン店' => {
    :id       => 1,
    :venue_id => '4d7dec0695c1a143cfe3c6f2',
    :name     => 'Starbucks Coffee 阪急大井町ガーデン店',
    :image    => '',
    :location => '大井町',
    :herenow  => 3,
    :full     => false,
  },
  '東京急行大井町駅店' => {
    :id       => 2,
    :venue_id => '4b56906df964a520511528e3',
    :name     => 'Starbucks Coffee 東京急行大井町駅店',
    :image    => '',
    :location => '大井町',
    :herenow  => 10,
    :full     => true,
  },
  'JR 東海品川駅店' => {
    :id       => 3,
    :venue_id => '4b5fd527f964a52036ce29e3',
    :name     => 'Starbucks Coffee JR東海 品川駅店',
    :image    => '',
    :location => '品川',
    :herenow  => 5,
    :full     => false,
  },
  '品川インターシティ店' => {
    :id       => 4,
    :venue_id => '4b74f27ff964a520f7f82de3',
    :name     => 'Starbucks Coffee 品川インターシティ店',
    :image    => '',
    :location => '品川',
    :herenow  => 1,
    :full     => false,
  },
}
cafes.values.each do |cafe|
  Cafe.create(cafe)
end
