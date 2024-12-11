# Hikayeler Yönetim Uygulaması

**Hikayeler Yönetim Uygulaması**, kullanıcıların hikaye eklemesine, okumasına, güncellemesine ve silmesine olanak tanır. Bu uygulama, hikaye bilgilerini saklamak için Trie veri yapısını kullanır ve Motoko dilinde yazılmıştır. Internet Computer platformunda çalışacak şekilde tasarlanmıştır.

## Özellikler

- **Hikaye Oluşturma:** Yeni hikayeler ekleyin.
- **Hikaye Okuma:** Mevcut hikayeleri görüntüleyin.
- **Hikaye Güncelleme:** Hikayeleri düzenleyin.
- **Hikaye Silme:** Hikayeleri kaldırın.

## Türler

- **StoryId:** Her hikayenin benzersiz kimliği (Nat32).
- **Story:** Hikaye bilgilerini içerir:

```motoko
public type Story = {
  name: Text;    // Hikayenin adı
  author: Text;  // Hikayenin yazarı
};
