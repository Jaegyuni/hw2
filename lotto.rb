require 'open-uri'
require 'json'
require 'awesome_print'
page = open("http://www.nlotto.co.kr/common.do?method=getLottoNumber")

lotto_read = page.read

lotto_json = JSON.parse(lotto_read)


winning_nums = Array.new



winning_nums.push(lotto_json["drwtNo1"])
winning_nums.push(lotto_json["drwtNo2"])
winning_nums.push(lotto_json["drwtNo3"])
winning_nums.push(lotto_json["drwtNo4"])
winning_nums.push(lotto_json["drwtNo5"])
winning_nums.push(lotto_json["drwtNo6"])


bonus_num = lotto_json["bnusNo"]


random_nums = Array.new 
random_nums_final = Array.new 


for i in 1..45
    random_nums.push(i)
end

yes_or_no = "yes" 

while yes_or_no =="yes"
    
    random_nums.shuffle! 
    random_nums_final=random_nums[0..5] 
    
    random_nums_final.sort! 
    winning_nums.sort! 
    
    count = 0 
    bNusCnt = 0 

    print "\n내 로또 번호   : "

    random_nums_final.each do
        |x|
        print "#{x} "
    end
    
    print "\n당첨 번호 : "
    winning_nums.each do
       |x|
       print "#{x} "
    end
    
    print "보너스 번호 : #{bonus_num}"
    
    
    
    for i in 0..5
        for j in 0..5
            if winning_nums[i]==random_nums_final[j]
                count+=1
            end 
        end
        
    end
    
    random_nums_final.each do |x|
        if bonus_num == x
            bNusCnt=1
        end
    end
    
    print "\n\n"
    
    if count==6
        puts "1등입니다."
    elsif count==5 && bNusCnt==1
        puts "2등입니다."
    elsif count==5
        puts "3등입니다"
    elsif count==4
        puts "4등입니다."
    elsif count==3
        puts "5등입니다."
    else
        puts "꽝"
    end
    
        
        puts "\n다시하시겠어요 ? 그럼 yes 입력"
        yes_or_no=gets.chomp
        
end
