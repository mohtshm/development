using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FrogsLilyPadOccupency
{
    class Program
    {
        static List<FrogLilyPadInfo> FrogLilyPadInfos = new List<FrogLilyPadInfo>();
        static void Main(string[] args)
        {
            LoadAllFrogLilyPadData();
            CalculateTopNoOfFrogBydoubleNesting();
            Console.ReadKey();
        }
        private static void CalculateTopNoOfFrogBydoubleNesting()
        {
            var sortedLilyPadWithTime =
                FrogLilyPadInfos
                .GroupBy(pd => pd.Pond)
                .Select(pdg => new
                {
                  pdg.Key,
                  PoolData = pdg
                  .GroupBy(lpi => new { lpi.ResidingPad })
                  .Select(pg => new
                  {
                      LilyPad = pg.Key,
                      TimeGroups = pg.GroupBy(tg => tg.PresenceTime).OrderByDescending(tgp => tgp.Count()).First(),
                      PaddingLeavingGroup = pg.Where(pi => pi.IsLeaving).OrderBy(pi => pi.PresenceTime).Select(pi => pi.PresenceTime)
                  }).OrderByDescending(pga => pga.TimeGroups.Count())
                }).ToList();
             
            foreach (var poolWiseGroup in sortedLilyPadWithTime)
            {
                Console.WriteLine("\n\n\t{0}", poolWiseGroup.Key);
                foreach (var pg in poolWiseGroup.PoolData)
                {
                    Console.WriteLine("\n\t\tLilypad Name : {0}", pg.LilyPad.ResidingPad);
                    Console.WriteLine("\n\t\t\t Peak occupany at {0} are : {1}", pg.TimeGroups.Key, pg.TimeGroups.Count());
                    Console.WriteLine("\n\t\t\t Peak occupancy ended at {0}", pg.PaddingLeavingGroup.First(pi => pi > pg.TimeGroups.Key));
                }
            }
        }
        private static void LoadAllFrogLilyPadData()
        {    
            //6/24/2014 0:04,6/24/2014 0:04 ,6/24/2014 17:13
            // h was throwing exception
            string[] dateFormats = { "MM/dd/yyyy HH:mm", "M/dd/yyyy H:mm", "M/dd/yyyy HH:mm" };
            using (System.IO.StreamReader sr = new StreamReader("Ponds_TechnicalTest.csv"))
            {
                string line = sr.ReadLine();
                line = sr.ReadLine();
                while (line != null)
                {
                        string[] lilyPadData = line.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                        if (lilyPadData.Length >= 6)
                        {
                            FrogLilyPadInfos.Add(new FrogLilyPadInfo
                            {
                                Pond = lilyPadData[0],
                                Frog = lilyPadData[1],
                                ResidingPad = lilyPadData[2],
                                PresenceTime = DateTime.ParseExact(lilyPadData[4], dateFormats, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None),
                                IsLeaving = true
                            });
                            FrogLilyPadInfos.Add(new FrogLilyPadInfo
                            {
                                Pond = lilyPadData[0],
                                Frog = lilyPadData[1],
                                ResidingPad = lilyPadData[3],
                                PresenceTime = DateTime.ParseExact(lilyPadData[5], dateFormats, System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None),
                                IsLeaving = false
                            });
                        }
                    line = sr.ReadLine();
                }
            }
        }
    }
}
