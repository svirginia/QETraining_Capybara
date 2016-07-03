def google_Page
	@google_Page ||=GoogleMainPage.new
end

class GoogleMainPage
	include Capybara::DSL #always a nivel te clases

	attr_reader :title

	def initialize
		@title=page.find('div[title="Google"]') #ya se ha hecho un find y se mantiene en cache
		@id_text_box = 'lst-ib'
	end

	def fill_Text_Box(value)
		page.fill_in @id_text_box,:with => value
	end

	def click_button(button_name)
		page.click_button button_name
	end

	def is_result_displayed(result_expected)
		return page.has_css?('h3',:text=> result_expected) #no es necesario el return, due to ruby return the last
	end
end