module ToyRobot
  module PoserInterfaceTest
    def test_it_implement_the_poser_interface
      assert_respond_to @object, :x
      assert_respond_to @object, :y
      assert_respond_to @object, :orientation
    end
  end
end
