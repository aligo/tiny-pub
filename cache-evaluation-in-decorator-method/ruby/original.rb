class Aniara

  def launch
    @launch ||= (-100...100).map do |x|
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