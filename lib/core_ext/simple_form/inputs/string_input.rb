SimpleForm::Inputs::StringInput.class_eval do
  alias :old_input_html_classes :input_html_classes
  def input_html_classes
    super + [:"text_fields"]
  end
end

SimpleForm::Inputs::PasswordInput.class_eval do
  alias :old_input_html_classes :input_html_classes
  def input_html_classes
    super + [:"text_fields"]
  end
end
