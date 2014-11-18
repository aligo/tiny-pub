class Aniara

  def self.cached_def method_name, &block
    define_method method_name do
      unless instance_variable_defined? "@#{method_name}"
        instance_variable_set "@#{method_name}", instance_eval(&block)
      end
      instance_variable_get("@#{method_name}")
    end
  end

  cached_def :launch do
    (-100...100).map do |x|
      (-100...100).map do |y|
        Math.atan2 x, y
      end
    end
  end

end

100.times do
  @spaceship = Aniara.new
  1000.times do
    @spaceship.launch
  end
end