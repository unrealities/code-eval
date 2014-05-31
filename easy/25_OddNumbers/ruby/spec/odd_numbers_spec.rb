require_relative 'spec_helper'

RSpec.describe OddNumbers do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe "#initialize" do
    it "should return correct test outputs given test input" do
      OddNumbers.new
      expect($stdout.string).to match('1\n3\n5\n7\n9\n11\n13\n15\n17\n19\n21\n23\n25\n27\n29\n31\n33\n35\n37\n39\n41\n43\n45\n47\n49\n51\n53\n55\n57\n59\n61\n63\n65\n67\n69\n71\n73\n75\n77\n79\n81\n83\n85\n87\n89\n91\n93\n95\n97\n99\n')
    end
  end
end