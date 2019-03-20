def stock_picker(array)
    array = array

    bestCombo = {}
    
    counter = 0
    until counter == (array.length - 1)
        array.drop(counter).each.with_index(counter) do |value,index|
            #puts "Value: #{value} Index: #{index}"
            
            buyPoint = array[counter] #each loop starts from next point each time, so always testing this point vs all others
            profit = array[index] - buyPoint
            
            next if counter == index # no point comparing same day figures
            
            if bestCombo.empty? 
                bestCombo = {:profit => profit, :buyIndex => counter, :sellIndex => index}
            elsif profit > bestCombo[:profit]
                bestCombo = {:profit => profit, :buyIndex => counter, :sellIndex => index}
            end
            
            #p profit
            #p bestCombo
            
        end
        #puts "------------"
        counter += 1
    end
    puts "The best profit made would be: #{bestCombo[:profit]}, by buying on week: #{bestCombo[:buyIndex]} and selling at week #{bestCombo[:sellIndex]}."
    return [bestCombo[:buyIndex],bestCombo[:sellIndex]]
end

p stock_picker([17,3,6,9,15,8,6,1,10])