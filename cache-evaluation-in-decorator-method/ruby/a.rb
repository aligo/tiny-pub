class Aniara

  def self.cached_def method_name, &block
    define_method method_name do
      result = instance_eval &block
      define_singleton_method method_name do
        result
      end
      result
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