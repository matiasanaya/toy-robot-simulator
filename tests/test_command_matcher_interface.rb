module CommandMatcherInterfaceTest
  def test_it_implement_the_command_matcher_interface
    assert_respond_to @object, :build_with_match
  end

  def test_that_it_matches_a_valid_string
    assert @object.build_with_match(@object_valid_str)
  end

  def test_that_it_ignores_invalid_strings
    @object_invalid_strs.each do |invalid|
      refute @object.build_with_match(invalid), "It should ignore '#{invalid}'"
    end
  end

  def test_that_response_knows_token
    assert_equal @object_token,
                 @object.build_with_match(@object_valid_str).token
  end

  def test_that_response_knows_args
    assert_respond_to @object.build_with_match(@object_valid_str),
                      :args
  end

  def test_that_response_is_nil
    assert_equal nil, @object.build_with_match(@object_invalid_strs.sample)
  end
end
