require 'test/helper'

class AdminFormHelperTest < ActiveSupport::TestCase

  include AdminFormHelper
  include ActionView::Helpers::FormHelper
  include ActionView::Helpers::DateHelper

  def test_build_form
    assert true
  end

  def test_typus_belongs_to_field
    assert true
  end

  def test_typus_boolean_field

    output = typus_boolean_field('test', Post)
    expected = <<-HTML
<li><label for="item_test">Test</label>
<input id="item_test" name="item[test]" type="checkbox" value="1" /><input name="item[test]" type="hidden" value="0" /> Checked if active</li>
    HTML

    assert_equal expected, output

    Post.expects(:typus_field_options_for).with(:questions).returns('test')
    output = typus_boolean_field('test', Post)
    assert_match /Test?/, output

  end

  def test_typus_date_field

    output = typus_date_field('test', {}, Post)
    expected = <<-HTML
<li><label for="item_test">Test</label>
    HTML

    assert_match expected, output

  end

  def test_typus_datetime_field

    output = typus_datetime_field('test', {}, Post)
    expected = <<-HTML
<li><label for="item_test">Test</label>
    HTML

    assert_match expected, output

  end

  def test_typus_file_field

    output = typus_file_field('asset_file_name', Post)
    expected = <<-HTML
<li><label for="item_asset_file_name">Asset</label>
<input id="item_asset" name="item[asset]" size="30" type="file" /></li>
    HTML

    assert_equal expected, output

  end

  def test_typus_password_field

    output = typus_password_field('test', Post)
    expected = <<-HTML
<li><label for="item_test">Test</label>
<input class="text" id="item_test" name="item[test]" size="30" type="password" /></li>
    HTML

    assert_equal expected, output

  end

  def test_typus_selector_field
    assert true
  end

  def test_typus_text_field

    output = typus_text_field('test', Post)
    expected = <<-HTML
<li><label for="item_test">Test</label>
<textarea class="text" cols="40" id="item_test" name="item[test]" rows="10"></textarea></li>
    HTML

    assert_equal expected, output

  end

  def test_typus_time_field

    output = typus_time_field('test', {}, Post)
    expected = <<-HTML
<li><label for="item_test">Test</label>
    HTML

    assert_match expected, output

  end

  def test_typus_tree_field
    assert true
  end

  def test_typus_string_field

    output = typus_string_field('test', Post)
    expected = <<-HTML
<li><label for="item_test">Test <small></small></label>
<input class="text" id="item_test" name="item[test]" size="30" type="text" /></li>
    HTML

    assert_equal expected, output

  end

  def test_typus_relationships
    assert true
  end

  def test_typus_form_has_many
    assert true
  end

  def test_typus_form_has_and_belongs_to_many
    assert true
  end

  def test_typus_template_field
    assert true
  end

  def test_attribute_disabled

    output = attribute_disabled?('test', Post)
    expected = false
    assert_equal expected, output

    Post.expects(:accessible_attributes).returns(['test'])
    output = attribute_disabled?('test', Post)
    assert_equal false, output

    Post.expects(:accessible_attributes).returns(['no_test'])
    output = attribute_disabled?('test', Post)
    assert output

  end

  def test_expand_tree_into_select_field
    assert true
  end

end