module ToyRobot
  module PoseInterfaceTest
    def test_pose_public_interface
      assert_respond_to @object, :mutate!
      assert_respond_to @object, :adjacent
      assert_respond_to @object, :rotate!
      assert_respond_to @object, :[]
    end

    def test_that_mutate_returns_the_receiver
      assert_equal @object, @object.mutate!
    end

    def test_that_adjacent_returns_a_pose_object
      assert_instance_of @object.class, @object.adjacent
    end

    def test_that_adjacent_does_not_return_the_receiver
      refute_equal @object, @object.adjacent
    end

    def test_that_rotate_returns_the_receiver
      assert_equal @object, @object.rotate!(1337)
    end
  end
end
