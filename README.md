Hikaye Yönetim Uygulaması
Hikaye Yönetim Uygulaması, kullanıcıların hikaye ekleyip, okumalarına, güncellemelerine ve silmelerine olanak tanıyan bir uygulamadır. Uygulama, hikaye verilerini organize etmek ve saklamak için trie veri yapısını kullanır. Bu uygulama, Motoko dilinde yazılmış ve Internet Computer platformunda çalışmak üzere tasarlanmıştır.

Özellikler
Hikaye Oluşturma: Yeni hikayeler eklenebilir.
Hikaye Okuma: Mevcut hikaye verilerine erişilebilir.
Hikaye Güncelleme: Var olan hikayeler güncellenebilir.
Hikaye Silme: Artık gerekli olmayan hikayeler veri tabanından kaldırılabilir.
Türler
StoryId: Her hikaye için benzersiz bir kimlik (Nat32 türünde).
Story: Hikaye bilgilerini içeren yapı:
motoko
Kodu kopyala
public type Story = {
  name: Text;    // Hikayenin adı
  author: Text;  // Hikayenin yazarı
};
Character: Hikayelerde kullanılabilecek bir karakter türü:
motoko
Kodu kopyala
public type Character = {
  name: Text;         // Karakterin adı
  description: Text;  // Karakter açıklaması
};
Event: Hikayedeki olayları tanımlayan yapı:
motoko
Kodu kopyala
public type Event = {
  description: Text;  // Olayın açıklaması
  result: Text;       // Olayın sonucu
};
Setting: Hikayelerin geçtiği ortamı tanımlayan yapı:
motoko
Kodu kopyala
public type Setting = {
  name: Text;         // Ortamın adı
  description: Text;  // Ortam açıklaması
};
API
1. create(story: Story): async StoryId
Yeni bir hikaye oluşturur ve veritabanına ekler. Benzersiz bir hikaye kimliği döndürür.

Örnek Kullanım:

motoko
Kodu kopyala
let story = {
  name = "Kayıp Şehir";
  author = "Eda";
};
let storyId = await Hikayeler.create(story);
2. read(storyId: StoryId): async ?Story
Belirtilen kimliğe ait hikayeyi döndürür. Eğer hikaye bulunamazsa null döner.

Örnek Kullanım:

motoko
Kodu kopyala
let story = await Hikayeler.read(storyId);
Debug.print(story);
3. update(storyId: StoryId, story: Story): async Bool
Belirtilen kimliğe sahip hikayeyi günceller. İşlem başarılı olursa true, aksi halde false döner.

Örnek Kullanım:

motoko
Kodu kopyala
let updatedStory = {
  name = "Kayıp Şehir: Geri Dönüş";
  author = "Eda";
};
let success = await Hikayeler.update(storyId, updatedStory);
4. delete(storyId: StoryId): async Bool
Belirtilen kimliğe sahip hikayeyi siler. İşlem başarılı olursa true, aksi halde false döner.

Örnek Kullanım:

motoko
Kodu kopyala
let success = await Hikayeler.delete(storyId);
Kullanım
Hikaye Ekleme: Yeni hikayeler ekleyerek veritabanını oluşturabilirsiniz.
Hikaye Okuma: Eklenen hikayelere ait bilgileri sorgulayabilirsiniz.
Hikaye Güncelleme: Var olan hikaye bilgilerini düzenleyebilirsiniz.
Hikaye Silme: Gerekli olmayan hikayeleri veritabanından kaldırabilirsiniz.
