
# テストフレームワーク minitest を利用する
require 'minitest/autorun'

# テスト結果の見た目を良くする
require 'minitest/reporters'
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

# テスト対象のRubyスクリプトを読み込む
require_relative '../lib/enemy.rb'

# テストを実行するためのクラス
class EnemyTest < Minitest::Test
  # 【この class を書き換える】
  def setup
    @enemy = EnemyTest.new('魔王の手下1', 200)
  end

  def test_name
    assert_equal(@enemy.name, '魔王の手下1')
  end

  def test_hp
    assert_equal(@enemy.hp, 200)
  end

  def test_dead
    enemy_hp1 = Enemy.new('魔王の手下1', 1)
    enemy_hp0 = Enemy.new('魔王の手下1', 0)
    enemy_hpminus = Enemy.new('魔王の手下1', -1)

    assert_equal(enemy_hp1.dead?, false)
    assert_equal(enemy_hp0.dead?, true)
    assert_equal(enemy_hpminus.dead?, true)
  end
end
