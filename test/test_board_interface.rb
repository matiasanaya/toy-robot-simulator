module ToyRobot
  module BoardInterfaceTest
    def test_board_public_interface
      assert_respond_to @object, :valid_pose?
    end

    def test_that_valid_pose_returns_nil
      assert_nil @object.valid_pose?(nil)
    end

    def test_that_valid_pose_returns_true_or_false
      assert_includes [true, false], @object.valid_pose?({})
    end
  end
end
