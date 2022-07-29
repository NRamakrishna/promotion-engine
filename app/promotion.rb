class Promotion
    A = 50
    B = 30
    C = 20
    D = 15
    puts "Total items price #{(1*A)+(1*B)+(1*C)}"
    scenario_b = "5*A+5*B+1*C".split("+")
    items_array1 = []
    scenario_b.each do |n|
        if n.include?'5*A'
           a_value = 3*A-130
           find_a = 5/3
           product_a = 5*A-(a_value*find_a)
            items_array1 << product_a
        elsif n.include?'5*B'
           b_value = 2*B-45
           find_b = 5/2
           product_b = 5*B-(b_value*find_b)
           items_array1 << product_b
        elsif n.include?'1*C'
            product_c = 1*C
            items_array1 << product_c
        end
    end
    total = items_array1.inject{|sum,x| sum+x}
    puts "Total items price #{total}"


    scenario_c = "3*A+5*B+1*C+1*D".split("+")
    items_array = []
    se3_c = []
    scenario_c.each do |n|
        if n.include?'3*A'
           a_value = 3*A-130
           find_a = 3/3
           product_a = 3*A-(a_value*find_a)
            items_array << product_a
        elsif n.include?'5*B'
            b_value = 2*B-45
           find_b = 5/2
           product_b = 5*B-(b_value*find_b)
             items_array << product_b
        elsif n.include?'1*C'
            product_c = 1*C
            se3_c << product_c
        elsif n.include?'1*D'
            unless se3_c.nil?
                product_d = 30
            else
               product_d = 1*C
            end
             items_array << product_d
        end
    end
    total = items_array.inject{|sum,x| sum+x}
    puts "Total items price #{total}"
end
