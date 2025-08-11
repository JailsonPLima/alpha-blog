# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Remove a formatação de estilo no formulário quando é gerado um erro ao criar
# ou editar um novo artigo. Necessário reiniciar o servidor ao aplicar a mudança
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end
